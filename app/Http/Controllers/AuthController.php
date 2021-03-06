<?php
namespace App\Http\Controllers;

use App\User;
use DB;
use Illuminate\Http\Request;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;

class AuthController extends Controller
{
    public $loginAfterSignUp = true;
    public function register(Request $request)
    {
        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = bcrypt($request->password);
        $user->save();
        if ($this->loginAfterSignUp) {
            return $this->login($request);
        }
        return response()->json([
            'status' => 'ok',
            'data' => $user,
        ], 200);
    }
    public function login(Request $request)
    {
        $persona = DB::SELECT("SELECT `idpersona`, `cedula`, `nombre`, `apellido`, `email`, `telefono`, `rol_idrol`, `updated_at`, `created_at`, `empresa_idempresa` FROM `persona` WHERE email = ? AND password = ?", [$request->email, sha1(md5($request->password))]);
        //$persona = DB::SELECT("SELECT * FROM persona WHERE email = ? AND password = ?", [$request->email, $request->password]);
        $input = $request->only('email', 'password');
        $jwt_token = null;
        if (!$jwt_token = JWTAuth::attempt($input)) {
            return response()->json([
                'status' => 'invalid_credentials',
                'message' => 'Correo o contraseña no válidos.',
            ], 401);
        }
        return response()->json([
            'datos' => $persona,
            'status' => 'ok',
            'token' => $jwt_token,
        ]);
    }
    public function logout(Request $request)
    {
        $this->validate($request, [
            'token' => 'required',
        ]);
        try {
            JWTAuth::invalidate($request->token);
            return response()->json([
                'status' => 'ok',
                'message' => 'Cierre de sesión exitoso.',
            ]);
        } catch (JWTException $exception) {
            return response()->json([
                'status' => 'unknown_error',
                'message' => 'Al persona no se le pudo cerrar la sesión.',
            ], 500);
        }
    }
    public function getAuthUser(Request $request)
    {
        $this->validate($request, [
            'token' => 'required',
        ]);
        $user = JWTAuth::authenticate($request->token);
        return response()->json(['user' => $user]);
    }
    protected function jsonResponse($data, $code = 200)
    {
        return response()->json($data, $code,
            ['Content-Type' => 'application/json;charset=UTF8', 'Charset' => 'utf-8'], JSON_UNESCAPED_UNICODE);
    }
}