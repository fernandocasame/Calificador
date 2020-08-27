<?php

use Illuminate\Http\Request;
Route::post('/login', 'AuthController@login');
Route::group(['middleware' => 'cors'],function(){
    Route::apiResource('empresa','EmpresaController');
    Route::apiResource('persona','PersonaController');
    Route::apiResource('nota','NotaController');
    Route::apiResource('rol','RolController');
    Route::apiResource('asistencia','AsistenciaController');
    Route::apiResource('persona_has_nota','PersonaHasNotaController');
    Route::apiResource('persona_has_asistencia','PersonaHasAsistenciaController');
    Route::get('b_persona','PersonaController@b_persona');
    Route::get('registrar','PersonaHasAsistenciaController@registrar');
    Route::get('registrarNota','PersonaHasNotaController@registrar');
    Route::get('notaPersona','PersonaHasNotaController@notaPersona');
    Route::get('setPersona','PersonaController@setPersona');
    Route::get('deletePersona','PersonaController@deletePersona');
});
