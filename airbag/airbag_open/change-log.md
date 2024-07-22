## V1
- model is currently 600m wide with a 80m wide inflator.
- used part trim and ele_edit to delete inner 150m radius from both side of airbag mesh
### Results
- Runs very simliar to $_{cv}$ case, but blows up at end
## V1 --> V2
![[Pasted image 20240716163009.png]]
### Results
- very similar, although the blowout was much worse at the end
- worry about this later, setting up collisions is much harder and more important
## V2 --> V3
- added rigidwall for floor
## V3 --> V10
- resized everything to 60 m wide (outer)
- ran into bug where after deleting old parts and then transforming a new part, the old ones would reappear, merge into the new part, and irreversibly fuck up everything, then id restart. this happened far too many times
- *still need to remap keywords* 
## V10 --> V12 
- mapped keywords, but the null material exploded during simulation
![[null-explode.gif]]

## V12 --> V13
- changed null mesh back to fabric
- same issues as before
## V13 --> V16
- added pid 1 to airbag part list
- works as desired, just inflates too quick and vanishes
## V16 --> V17
- divided maximum of mass flow rate curve by 10
- made no difference
## V17 --> V18
- added timestep card (1e-5)
- inflated as quick, but didnt blow up til later
## V18 --> V19
- slightly slowed down explosion of mesh by changing timestep to 1e-7
## V19 --> V20
- changed load curve and limited end time to 30 (s)
![[Pasted image 20240718120135.png]]
## V20 --> V21
- resized and translated RIGIWALL_PLANAR
- needs to move down 1 (m)
- also might need to swap this for solid mesh if im planning on adding anchor nodes
## V21 --> V23
- deleted RIGIDWALL_PLANAR
- created solid box mesh
[[Pasted image 20240718134644.png]] (details on mesh)
- copied gas nozzle properties over to it
- 1000s of errors cause by SECTION_SHELL being attached to PID 4 when it is a SOLID.
![[Pasted image 20240718141656.png]]
## V23 --> V24
- fixed last error by creating a SECTION_SOLI card and assigning it to PID 4.
- now everything works the same as before the resize
## V24 --> V25
- created null material with 1e-5 YM and 1e-7 density, these are pulled out of nowhere and will change later. 
- attached null material card to PID 2
![[null-material-v25.gif]]
- at the end i showed the null material. I dont know why it explodes like that. Also collisions havent been implemented yet, this just didnt inflate enough to collide
## V25 to V26
- changed null material properties ![[Pasted image 20240718151501.png]]
- runtime is ~ 10s
- problem appears to be null material doesnt stop expanding when the fabric does. this needs to be restricted
## V27
- set pressure cutoff of null to 1
- no effect
## V28
- changed it to 1e-5
- same thing
- need to find some way to limit the maximum volume or pressure of the airbag. simple volume math
## V29
- changed endtime to 40 s
- sim explodes at 10s
## V30 
![[Pasted image 20240719115124.png]]
## V31
- not sure if A or B is the master or slave (might matter for collisions)
![[Pasted image 20240719143547.png]]
- the model floats away, probably cause the null material is peircing the solid box below
- but collisions work
- will try null material as fabric with max porosity next
![[collisions-on-null-fucked.gif]]
## V32
- added fabric card and made it more permeable and attached it to null material
![[Pasted image 20240719150533.png]]
- seems to work, turns upside down because inflation pressure too high and no anchor nodes yet
- for anchor nodes, need to look back at parachute model for reference
![[collisions-on-null=porous-fabric.gif]]
## V34
- considering adding physical anchors to mesh, would need to redesign.
	- problem with this would be control volume airbag would be penetrated and no longer closed. (raises error and wont run correctly if i were to do this)
		- would work for the wind tunnel case (not currently running)
	- might just figure out how to use joints / beams to keep it anchored in the meantime
- gonna try and bring base plate closer and see if inflation still works
	- TESTED: still works fine
![[Pasted image 20240722144103.png]]
![[Pasted image 20240722144515.png]]![[Pasted image 20240722145105.png]]
## V35
- start with one anchor, then tes
![[Screenshot 2024-07-22 151701.png|300]]