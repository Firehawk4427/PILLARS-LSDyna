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
- CONTROL_TIMESTEP init timestep changed to 1e-8
### Results
- same as before
## V26 --> V27
- fixed boundary constraints
- changed to **Solid-in-Shell Immersed Coupling (EQ.2)**
	- This refers to a more complex coupling where solid elements are immersed within shell elements, possibly in a fluid domain or within a structure. This can simulate scenarios like fluid-structure interactions (FSI) where solid elements interact with surrounding fluids represented by shell elements.
[[Pasted image 20240715150639.png]]
### Results
- same as before
## V27 --> V28
- changed density of fabric to that of kevlar
![[Pasted image 20240715160706.png]]
- unit system of (kg, m, s)

 

