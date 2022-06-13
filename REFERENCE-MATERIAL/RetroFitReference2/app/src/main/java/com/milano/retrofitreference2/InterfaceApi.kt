package com.milano.retrofitreference2

import retrofit2.Response
import retrofit2.http.GET

interface InterfaceApi {

    @GET("/todos")
    suspend fun getTodos(): Response<List<Todo>>

}