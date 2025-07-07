# Virtual-Pilot-Coaster-Simulator
MATLAB design for a pilot-simulating coaster — with loops, zero-G parabola, banked turns, and realistic G-force analysis.

# Overview
This repository contains MATLAB code for designing and analyzing a virtual roller coaster that simulates pilot flight maneuvers using VR. The track includes key segments: a banked turn, loop, zero-G parabola, braking section, and transition arcs — all modeled to evaluate G-forces and ride dynamics.

# Contents
- asen1.m, bankedTurnTest.m, gforceplotbanked.m, gforcesallbanked.m, latGforceBanked.m — Scripts for banked turn forces, plots, and checks.
- accdiagrambanked.m, forwardbackGsbanked.m — Additional banked turn force resolution and acceleration diagrams.
- Other segments: loop, parabola, braking, and transitions are coded in their respective files, merged into a complete track model.
- resources/ — Any helper data or plots.
- BankedTurn2803.prj — MATLAB project file for easy management.

# What It Does
- Models a VR roller coaster track with frictionless motion (except braking).
- Calculates and plots G-forces in vertical, lateral, and tangential directions.
- Analyzes pilot comfort and safety using derived dynamics.
- Visualizes how each track element affects ride experience.

# How to Run
- Clone this repo.
- Open BankedTurn2803.prj in MATLAB.
- Run the main scripts in sequence to generate plots for each segment.
- Check banked turn dynamics for lateral force balancing and safe centripetal motion
