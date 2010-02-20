# Call parameters:
#   $0 - datafilename
#   $1 - outputfilename

set terminal push
set terminal png size 1290,770

set datafile separator ","
set grid
set autoscale
set key top left box
set title  "Latency per Process"
set xlabel "# Processes"
set ylabel "Latency (microseconds)"
set format x "%.0s"
set format y "%.1s%cS"

set output '$1.png'
plot '$0'\
     index 2 using 2:($$3/2):(0.1) t "TCP"                    with lines smooth acspline,\
  '' index 3 using 2:($$3/2):(0.1) t "UDP"                    with lines smooth acspline,\
  '' index 0 using 2:($$3/2):(0.1) t "multicast/best effort"  with lines smooth acspline,\
  '' index 1 using 2:($$3/2):(0.1) t "multicast/reliable"     with lines smooth acspline

set output '$1.png'
replot

set output
set terminal pop

