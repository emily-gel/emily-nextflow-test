#!/usr/bin/env nextflow

nextflow.enable.dsl=2

params.greeting  = 'Hello world!'
greeting_ch = Channel.from(params.greeting)

include { SPLITLETTERS } from './hello_processes.nf'

workflow{
    letters_ch = SPLITLETTERS(greeting_ch)
    letters_ch.view{ it }
}
