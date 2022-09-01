#!/usr/bin/env nextflow

params.greeting  = 'Hello world!'
greeting_ch = Channel.from(params.greeting)

process SPLITLETTERS {
    input:
    val x from greeting_ch

    output:
    file 'chunk_*' into letters_ch

    script:
    """
    printf '$x' | split -b 6 - chunk_
    """
}

process COWSAY {
    input:
    val y from letters_ch.flatten()

    output:
    stdout ch

    script:
    """
    cowsay $y.text
    """
}
