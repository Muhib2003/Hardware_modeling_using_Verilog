onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /DMux1to2/in
add wave -noupdate -expand -group output /DMux1to2/out0
add wave -noupdate -expand -group output /DMux1to2/out1
add wave -noupdate -expand -group input /DMux1to2/in
add wave -noupdate -expand -group select /DMux1to2/sel
add wave -noupdate /DMux1to2/sn
add wave -noupdate /DMux1to2/y0
add wave -noupdate /DMux1to2/y1
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {326 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {21348 ps}
