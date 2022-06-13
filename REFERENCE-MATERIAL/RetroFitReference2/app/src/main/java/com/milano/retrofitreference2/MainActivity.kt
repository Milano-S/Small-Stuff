package com.milano.retrofitreference2

import android.os.Bundle
import android.util.Log
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.isVisible
import androidx.lifecycle.lifecycleScope
import androidx.recyclerview.widget.LinearLayoutManager
import com.milano.retrofitreference2.databinding.ActivityMainBinding
import okio.IOException
import retrofit2.HttpException

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding
    private lateinit var todoAdapter: RvAdapter

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        setupRV()

        lifecycleScope.launchWhenCreated {
            binding.pg.isVisible = true

            val response = try {
                RetrofitInstance.api.getTodos()
            } catch (e: IOException) {
                Log.e("Main", "IOException")
                binding.pg.isVisible = false
                return@launchWhenCreated

            } catch (e: HttpException) {
                Log.e("Main", "HTTP Exception")
                binding.pg.isVisible = false
                return@launchWhenCreated
            }
            if (response.isSuccessful && response.body() != null) {
                todoAdapter.todos = response.body()!!
            } else {
                Log.e("Main", "Response Exception")
            }
            binding.pg.isVisible = false
        }

    }

    private fun setupRV() = binding.rvR.apply {
        todoAdapter = RvAdapter()
        adapter = todoAdapter
        layoutManager = LinearLayoutManager(this@MainActivity)

    }
}