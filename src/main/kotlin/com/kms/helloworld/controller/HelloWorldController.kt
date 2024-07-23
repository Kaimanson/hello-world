package com.kms.helloworld.controller

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import java.time.LocalDateTime

@RestController
@RequestMapping("/hello-world")
class HelloWorldController {

    @GetMapping
    fun getHelloWorld() = "hello! ${LocalDateTime.now()}"
}