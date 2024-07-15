## V23 --> V24
- deleted auto_surf2surf (collision between parachute and base plate) to speed up simulation while debugging
### Results
- reduced sim time by ~50%, was 40 min before
[[PILLARS_v24_stress.gif]] - nothing really happens except weird stress fluctuations
## V24 --> V25
- deleted boundary_ambient_EOS
[[Pasted image 20240715134012.png]] - for reference
### Results
- runs in 2 sec
- same result as before
- might need to rebuild model from the ground up using a multiphysics solver like dualcese
- airbag with nullspace might not work cause it would not match actual inflation parameters
## V25 --> V26
- CONTROL_TIMESTEP
 

 

