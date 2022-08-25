#!/usr/bin/env nextflow

process SPLITLETTERS {
    input:
    val x

    output:
    file 'chunk_*'

    script:
    """
    printf '$x' | split -b 6 - chunk_
    """
}

process COWSAY {
    input:
    val y

    output:
    file 'cow_*'

    script:
    """
    cowsay $y.text
    """
}
