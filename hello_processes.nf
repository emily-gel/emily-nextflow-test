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
