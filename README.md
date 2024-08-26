###### NOTE: Log files and notes are in markdown format meant for obsidian, but should work with other programs (https://obsidian.md/download)

## TODO (no specific order)
---
***Debug PILLARS model (never done)
- [x] add in anchors (constrained nodes)
	- [ ] more anchors
- [x] add gravity (1/6 earth)
- [ ] test off nominal
	- [ ] to make an off nominal case, move the top part of gas nozzle to blue fabric pid. then delete walls and translate top down. then merge nodes. next pt trim the new area, translate up, and ele gen a new edge drag down to the fabric, then merge nodes again
	- [ ] get load curve for stress on anchors as a function of off nominal distance
- [ ] test stress around anchor nodes
- [ ] make the inner fabric mesh able to stretch so it doesn't constrain geometry of outer mesh
- [x] add collisions
- [x] fix fabric mesh
- [x] add in single_surface_contact so mesh doesnt collide with itself
- [x] swap simple model for hybrid (or WANG_NEFSKE) model w/ leakage support
	- [ ] Tweak the leakage support parameters
- [x] need to find accurate numbers for sim parameters
- [x] redo anchors more accurately with shells and beams
	- [x] need to replace solid base with shell closer to fabric or move solid mesh closer and figure out how to refine it
	- [x] seems like solids can only be refined by editing their geometry file or manually creating the mesh