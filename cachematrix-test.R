
## Testing - not part of submission
#
mrand <- matrix(rnorm(9),3,3)
mfixed <-matrix(c(1.0077773,0.9668070,-0.1028087,
                  -0.8177731,0.2416029,-0.5844594,
                  -0.2746756,0.1222718,-0.6082237),3,3)
mfixedinv = solve(mfixed)
mfixedinv

