package com.example.mathgame3.viewModel

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel

class viewModel: ViewModel() {

    private val _userScore = MutableLiveData(0)
    val userScore: LiveData<Int> = _userScore

    fun setUserScore(score :Int){
        _userScore.value = score
    }
}