## V1
- model is currently 600m wide with a 80m widde inflator.
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
## V3 --> V4
- resized everything to 60 m wide (outer)
- *still need to remap keywords 