<?php

use Illuminate\Http\Request;
Route::group(['middleware' => 'cors'],function(){
    Route::apiResource('persona','PersonaController');
    Route::apiResource('nota','NotaController');
    Route::apiResource('asistencia','AsistenciaController');
    Route::apiResource('persona_has_nota','PersonaHasNotaController');
    Route::apiResource('persona_has_asistencia','PersonaHasAsistenciaController');
    Route::get('b_persona','PersonaController@b_persona');
    Route::get('registrar','PersonaHasAsistenciaController@registrar');
});
