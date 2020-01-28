<?php

namespace App\Http\Controllers;

use App\asistencia;
use Illuminate\Http\Request;

class AsistenciaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
        $asistencia = new Asistencia();
        $asistencia->nombre = $request->nombre;
        $asistencia->detalle = $request->detalle;
        $asistencia->save();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\asistencia  $asistencia
     * @return \Illuminate\Http\Response
     */
    public function show(asistencia $asistencia)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\asistencia  $asistencia
     * @return \Illuminate\Http\Response
     */
    public function edit(asistencia $asistencia)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\asistencia  $asistencia
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, asistencia $asistencia)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\asistencia  $asistencia
     * @return \Illuminate\Http\Response
     */
    public function destroy(asistencia $asistencia)
    {
        //
    }
}
