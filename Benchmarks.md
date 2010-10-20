# Benchmarks

Benchmarks for the {Combinatorics} code can be found in the `benchmarks/`
directory.

Benchmark machine specs:

* CPU: AMD Athlon(tm) 64 Processor 3400+ (2202.785 MHz)
* Cache Size: 1024 KB
* Memory: 1 Gb

## List Comprehensions:

Ruby 1.9.2-p0 (2010-08-18 revision 29036) [x86_64-linux]:

                      user     system      total        real
    singleton:    0.060000   0.010000   0.070000 (  0.090075)
    single-enum:  0.020000   0.000000   0.020000 (  0.035206)
    depth 1:      0.000000   0.000000   0.000000 (  0.002489)
    depth 2:      0.240000   0.000000   0.240000 (  0.306060)
    depth 3:     40.090000   0.250000  40.340000 ( 51.830667)

Ruby 1.8.7 (2010-08-16 patchlevel 302) [x86_64-linux]:

                      user     system      total        real
    singleton:    0.410000   0.290000   0.700000 (  0.929625)
    single-enum:  0.050000   0.130000   0.180000 (  0.348974)
    depth 1:      0.030000   0.050000   0.080000 (  0.111043)
    depth 2:     15.650000   0.560000  16.210000 ( 23.012478)
    depth 3:    3239.310000  15.950000 3255.260000 (3739.261379)

JRuby 1.5.3 (ruby 1.8.7 patchlevel 249) (2010-09-28 7ca06d7)
(OpenJDK 64-Bit Server VM 1.6.0_18) [amd64-java]:

                      user     system      total        real
    singleton:    1.019000   0.000000   1.019000 (  0.870000)
    single-enum:  0.325000   0.000000   0.325000 (  0.325000)
    depth 1:      0.088000   0.000000   0.088000 (  0.088000)
    depth 2:      5.045000   0.000000   5.045000 (  5.044000)
    depth 3:    275.765000   0.000000 275.765000 (275.765000)

Rubinius 1.1.1dev (1.8.7 8bc2dc9a 2010-09-23 JI) [x86_64-unknown-linux-gnu]:

                      user     system      total        real
    singleton:    1.143827   0.088987   1.232814 (  1.523531)
    single-enum:  0.313953   0.028996   0.342949 (  0.423621)
    depth 1:      0.001999   0.000999   0.002998 (  0.003840)
    depth 2:      1.051840   0.030996   1.082836 (  1.293856)
    depth 3:     42.303569   5.777121  48.080690 ( 57.556785)

