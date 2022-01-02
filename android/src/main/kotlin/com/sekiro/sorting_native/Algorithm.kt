package com.sekiro.sorting_native

import kotlin.random.Random

object Algorithm {
    fun quickSort(input: List<Int>): List<Int> {
        if (input.size <= 1) return input
        val pivotIdx = Random.nextInt(input.size)
        val pivot = input[pivotIdx]
        val left = arrayListOf<Int>()
        val right = arrayListOf<Int>()
        input.forEachIndexed { index, value ->
            if (index != pivotIdx) {
                if (value >= pivot) {
                    right.add(value)
                } else {
                    left.add(value)
                }
            }
        }
        val result = arrayListOf<Int>()
        result.addAll(quickSort(left))
        result.add(pivot)
        result.addAll(quickSort(right))
        return result;
    }
}