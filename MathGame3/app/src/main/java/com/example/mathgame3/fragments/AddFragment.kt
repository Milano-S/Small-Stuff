package com.example.mathgame3.fragments

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import android.widget.Toast
import androidx.fragment.app.activityViewModels
import androidx.navigation.fragment.findNavController
import com.example.mathgame3.R
import com.example.mathgame3.viewModel.viewModel

class addFragment : Fragment() {

    private val sharedviewModel: viewModel by activityViewModels()

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        val view = inflater.inflate(R.layout.fragment_add, container, false)

        val textQuestion = view.findViewById<TextView>(R.id.textViewQuestion)
        val editTextAnswer = view.findViewById<EditText>(R.id.editTextAnswer)
        val textViewScore = view.findViewById<TextView>(R.id.textViewScore)
        val textLife = view.findViewById<TextView>(R.id.textViewLife)

        var correctAns: Int = 0
        var userScore: Int = 0
        var userLife: Int = 3


        fun generateQues() {
            val num1: Int = (1..100).random()
            val num2: Int = (1..100).random()
            textQuestion.text = "$num1 + $num2"
            correctAns = num1 + num2
        }
        generateQues()

        fun checkAns(){
            if (editTextAnswer.text.toString() != correctAns.toString()){
                Toast.makeText(context, "WRONG!", Toast.LENGTH_SHORT).show()
                textQuestion.text = "WRONG!"
                textViewScore.text = "$userScore"
                userLife --
                textLife.text = "$userLife"
                editTextAnswer.setText("")
            }else{
                Toast.makeText(context, "CORRECT!", Toast.LENGTH_SHORT).show()
                textQuestion.text = "CORRECT!"
                userScore += 10
                textViewScore.text = "$userScore"
            }
        }

        fun ifEmpty(){
                Toast.makeText(context, "Enter Something!", Toast.LENGTH_SHORT).show()
        }

        fun ifLifeEmpty(){
            if(userLife == 0){
                sharedviewModel.setUserScore(userScore)
                findNavController().navigate(R.id.action_addFragment_to_endFragment)
            }
        }

        val buttonOk = view.findViewById<Button>(R.id.buttonOk)
        buttonOk.setOnClickListener {
            if (editTextAnswer.text.toString() == ""){
                ifEmpty()
            }else{
                checkAns()
                ifLifeEmpty()
            }
        }

        val buttonNext = view.findViewById<Button>(R.id.buttonNext)
        buttonNext.setOnClickListener {
            generateQues()
            editTextAnswer.setText("")
        }

        val buttonEnd = view.findViewById<Button>(R.id.buttonEnd)
        buttonEnd.setOnClickListener {
            sharedviewModel.setUserScore(userScore)
            findNavController().navigate(R.id.action_addFragment_to_endFragment)
        }

        return view
    }

}