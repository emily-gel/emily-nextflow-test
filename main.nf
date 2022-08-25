#!/usr/bin/env nextflow

nextflow.enabled.dsl=2

params.greeting  = 'Hello world!'
greeting_ch = Channel.from(params.greeting)

include { SPLITLETTERS ; COWSAY } from './hello_processes.nf'

workflow{
    letters_ch = SPLITLETTERS(greeting_ch)
    results_ch = COWSAY(letters_ch.flatten())
    results_ch.view{ it }
}
