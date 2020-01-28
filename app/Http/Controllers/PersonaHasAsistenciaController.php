<?php

namespace App\Http\Controllers;

use App\persona_has_asistencia;
use Illuminate\Http\Request;
use DB;
use DateTime;
class PersonaHasAsistenciaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $date = new DateTime();
        $registro = DB::SELECT(' CALL `getRegistro`(?,?);',[$request->idpersona,$date->format('y-m-d')]);
        return $registro;
    }

    public function registrar(Request $request){
        $date = new DateTime();
        if($date->format('H:i:s') >= '06:00:00' && $date->format('H:i:s') <= '09:00:00' ){
            $registro = new persona_has_asistencia();
            $registro->persona_idpersona = $request->idpersona;
            $registro->asistencia_id = '1';
            $registro->fecha_registro = $date;
            $registro->hora_registro = $date->format('H:i:s');
            $registro->save();
        }
        if($date->format('H:i:s') >= '12:00:00' && $date->format('H:i:s') <= '13:00:00' ){
            $registro = new persona_has_asistencia();
            $registro->persona_idpersona = $request->idpersona;
            $registro->asistencia_id = '2';
            $registro->fecha_registro = $date;
            $registro->hora_registro = $date->format('H:i:s');
            $registro->save();
        }
        if($date->format('H:i:s') >= '13:00:00' && $date->format('H:i:s') <= '14:00:00' ){
            $registro = new persona_has_asistencia();
            $registro->persona_idpersona = $request->idpersona;
            $registro->asistencia_id = '3';
            $registro->fecha_registro = $date;
            $registro->hora_registro = $date->format('H:i:s');
            $registro->save();
        }
        if($date->format('H:i:s') >= '16:00:00' && $date->format('H:i:s') <= '18:00:00' ){
            $registro = new persona_has_asistencia();
            $registro->persona_idpersona = $request->idpersona;
            $registro->asistencia_id = '4';
            $registro->fecha_registro = $date;
            $registro->hora_registro = $date->format('H:i:s');
            $registro->save();
        }
        return $registro;
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
        $registro = new PersonaHasAsistencia();
        $registro->persona_idpersona = $request->persona_idpersona;
        $registro->asistencia_id = $request->asistencia_id;
        $registro->fecha_registro = $request->fecha_registro;
        $registro->save();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\persona_has_asistencia  $persona_has_asistencia
     * @return \Illuminate\Http\Response
     */
    public function show(persona_has_asistencia $persona_has_asistencia)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\persona_has_asistencia  $persona_has_asistencia
     * @return \Illuminate\Http\Response
     */
    public function edit(persona_has_asistencia $persona_has_asistencia)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\persona_has_asistencia  $persona_has_asistencia
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, persona_has_asistencia $persona_has_asistencia)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\persona_has_asistencia  $persona_has_asistencia
     * @return \Illuminate\Http\Response
     */
    public function destroy(persona_has_asistencia $persona_has_asistencia)
    {
        //
    }
}
