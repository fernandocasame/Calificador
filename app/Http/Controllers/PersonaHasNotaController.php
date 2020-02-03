<?php

namespace App\Http\Controllers;

use App\persona_has_nota;
use Illuminate\Http\Request;
use DB;
class PersonaHasNotaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $total = DB::SELECT("CALL `nota_total`();");
        return $total;
    }

    public function notaPersona(Request $request){
        $notas = DB::SELECT("CALL nota_usuario(?)",[$request->idpersona]);
        return $notas;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $nota = new persona_has_nota();
        $nota->persona_idpersona = $request->idpersona;
        $nota->nota_idnota = $request->idnota;
        $nota->save();
    }

    public function registrar(Request $request)
    {
        $nota = new persona_has_nota();
        $nota->persona_idpersona = $request->idpersona;
        $nota->nota_idnota = $request->idnota;
        $nota->save();

        $notas = DB::SELECT("CALL nota_usuario(?)",[$request->idpersona]);
        $suma = 0;
        foreach($notas as $dato){
            $suma = $suma + $dato->total;
        }
        return $suma;
    }



    /**
     * Display the specified resource.
     *
     * @param  \App\persona_has_nota  $persona_has_nota
     * @return \Illuminate\Http\Response
     */
    public function show(persona_has_nota $persona_has_nota)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\persona_has_nota  $persona_has_nota
     * @return \Illuminate\Http\Response
     */
    public function edit(persona_has_nota $persona_has_nota)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\persona_has_nota  $persona_has_nota
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, persona_has_nota $persona_has_nota)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\persona_has_nota  $persona_has_nota
     * @return \Illuminate\Http\Response
     */
    public function destroy(persona_has_nota $persona_has_nota)
    {
        //
    }
}
