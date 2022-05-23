package com.example.mathgame3.fragments

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.TextView
import androidx.fragment.app.activityViewModels
import androidx.navigation.fragment.findNavController
import com.example.mathgame3.R
import com.example.mathgame3.viewModel.viewModel


class endFragment : Fragment() {

    private val sharedviewModel: viewModel by activityViewModels()

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        val view = inflater.inflate(R.layout.fragment_end, container, false)

       val score = view.findViewById<TextView>(R.id.textViewResult)
        val finalScore = sharedviewModel.userScore
        finalScore.value?.plus(10)
        val finalScore1 = finalScore.value
        score.text = "Score: $finalScore1"

        val buttonAgain = view.findViewById<Button>(R.id.buttonAgain)
        buttonAgain.setOnClickListener {
            findNavController().navigate(R.id.action_endFragment_to_startFragment)
        }
        val buttonExit = view.findViewById<Button>(R.id.buttonExit)
        buttonExit.setOnClickListener {
            fun crash(){
                1/0
            }
            crash()
        }
        return view
    }
}