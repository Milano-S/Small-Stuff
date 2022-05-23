package com.example.mathgame3.fragments

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import androidx.fragment.app.Fragment
import androidx.navigation.fragment.findNavController
import com.example.mathgame3.R


class startFragment : Fragment() {

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        val view = inflater.inflate(R.layout.fragment_start, container, false)

        val btnAdd = view.findViewById<Button>(R.id.buttonAdd)
        btnAdd.setOnClickListener {
            findNavController().navigate(R.id.action_startFragment_to_addFragment)
        }
        val btnSub = view.findViewById<Button>(R.id.buttonSub)
        btnSub.setOnClickListener {
            findNavController().navigate(R.id.action_startFragment_to_subFragment)
        }

        return view
    }
}