# impact des poids sur les chemins, OSPF

#Create a simulator object
set ns [new Simulator]

#Define different colors for data flows
$ns color 1 Red
$ns color 2 Blue
$ns color 3 Green
$ns color 4 Yellow
$ns color 5 Orange
$ns color 6 Pink
$ns color 7 Turquoise


#Open the nam trace file
#ouvre une file utilisee pour l'animation
set nf [open out_exo5.nam w]
$ns namtrace-all $nf

#Define a 'finish' procedure
#a la fin de la simu, lancer l'animation
proc finish {} {
        global ns nf
        $ns flush-trace
	#Close the trace file
        close $nf
	#Execute nam on the trace file
        exec nam out_exo5.nam &
        exit 0
}

#Create  nodes
for {set i 0} {$i < 8} {incr i} {
set r($i) [$ns node]
}

for {set i 0} {$i < 8} {incr i} {
#$r($i) shape hexagon
$r($i) color blue
}

#$r(0) set X_ 0.0
#$r(0) set Y_ 0.0

#$r(1) set X_ 100.0
#$r(1) set Y_ 0.0

#$r(2) set X_ 50.0
#$r(2) set Y_ 50.0

#$r(3) set X_ 100.0
#$r(3) set Y_ 100.0

#$r(4) set X_ 50.0
#$r(4) set Y_ 250.0

#$r(5) set X_ 150.0
#$r(5) set Y_ 300.0

#$r(6) set X_ 150.0
#$r(6) set Y_ 50.0

#$r(7) set X_ 200.0
#$r(7) set Y_ 0.0
#Create links between the nodes
#definition des extremites, du debit disponible, du delai, de la politique de rejet
#definition de l'orientation des liens dans l'animateur
#definition des labels sur les liens

#=======================0==1=======================
$ns duplex-link $r(0) $r(1) 1.75Mb 18ms DropTail
$ns cost $r(0) $r(1) 8
$ns cost $r(1) $r(0) 8
$ns duplex-link-op $r(0) $r(1) orient right
#$ns duplex-link-op $r(0) $r(1) label "XXXXX"

#=======================0==2=======================
$ns duplex-link $r(0) $r(2) 3.5Mb 17ms DropTail
$ns cost $r(0) $r(2) 1
$ns cost $r(2) $r(0) 1
$ns duplex-link-op $r(0) $r(2) orient right-up
#$ns duplex-link-op $r(0) $r(2) label "XX"

#=======================1==2=======================
$ns duplex-link $r(1) $r(2) 2.25Mb 14ms DropTail
$ns cost $r(1) $r(2) 4
$ns cost $r(2) $r(1) 4
$ns duplex-link-op $r(1) $r(2) orient left-up
#$ns duplex-link-op $r(1) $r(2) label "XXX"

#=======================1==3=======================
$ns duplex-link $r(1) $r(3) 1.25Mb 10ms DropTail
$ns cost $r(1) $r(3) 5
$ns cost $r(3) $r(1) 5
$ns duplex-link-op $r(1) $r(3) orient up
#$ns duplex-link-op $r(1) $r(3) label "X"

#=======================1==6=======================
$ns duplex-link $r(1) $r(6) 0.5Mb 16ms DropTail
$ns cost $r(1) $r(6) 6
$ns cost $r(6) $r(1) 6
$ns duplex-link-op $r(1) $r(6) orient right-up
#$ns duplex-link-op $r(1) $r(6) label "X"

#=======================1==7=======================
$ns duplex-link $r(1) $r(7) 3.25Mb 19ms DropTail
$ns cost $r(1) $r(7) 14
$ns cost $r(7) $r(1) 14
$ns duplex-link-op $r(1) $r(7) orient right
#$ns duplex-link-op $r(7) $r(1) label "XXX"

#=======================2==3=======================
$ns duplex-link $r(2) $r(3) 2.5Mb 9ms DropTail
$ns cost $r(2) $r(3) 13
$ns cost $r(3) $r(2) 13
$ns duplex-link-op $r(2) $r(3) orient right-up
#$ns duplex-link-op $r(2) $r(3) label "XXXXX"

#=======================2==4=======================
$ns duplex-link $r(2) $r(4) 1.5Mb 11ms DropTail
$ns cost $r(2) $r(4) 7
$ns cost $r(4) $r(2) 7
$ns duplex-link-op $r(2) $r(4) orient up
#$ns duplex-link-op $r(2) $r(4) label "X"

#=======================3==4=======================
$ns duplex-link $r(3) $r(4) 2.75Mb 15ms DropTail
$ns cost $r(3) $r(4) 11
$ns cost $r(4) $r(3) 11
$ns duplex-link-op $r(3) $r(4) orient left-up
#$ns duplex-link-op $r(3) $r(4) label "XXXXX"

#=======================3==5=======================
$ns duplex-link $r(3) $r(5) 0.25Mb 8ms DropTail
$ns cost $r(3) $r(5) 10
$ns cost $r(5) $r(3) 10
$ns duplex-link-op $r(3) $r(5) orient right-up
#$ns duplex-link-op $r(3) $r(5) label "X"

#=======================3==6=======================
$ns duplex-link $r(3) $r(6) 2.0Mb 12ms DropTail
$ns cost $r(3) $r(6) 3
$ns cost $r(6) $r(3) 3
$ns duplex-link-op $r(6) $r(3) orient left-up
#$ns duplex-link-op $r(6) $r(3) label "XXXXX"

#=======================4==5=======================
$ns duplex-link $r(4) $r(5) 3.0Mb 13ms DropTail
$ns cost $r(4) $r(5) 9
$ns cost $r(5) $r(4) 9
$ns duplex-link-op $r(4) $r(5) orient right
#$ns duplex-link-op $r(4) $r(5) label "XXXXX"

#=======================5==6=======================
$ns duplex-link $r(5) $r(6) 1.0Mb 21ms DropTail
$ns cost $r(5) $r(6) 12
$ns cost $r(6) $r(5) 12
$ns duplex-link-op $r(6) $r(5) orient up
#$ns duplex-link-op $r(6) $r(5) label "XX"

#=======================6==7=======================
$ns duplex-link $r(6) $r(7) 0.75Mb 20ms DropTail
$ns cost $r(6) $r(7) 2
$ns cost $r(7) $r(6) 2
$ns duplex-link-op $r(7) $r(6) orient left-up
#$ns duplex-link-op $r(7) $r(6) label "XX"

$ns rtproto Session


# create  a sink agent  and attach it to node 
set sink_tcp0 [new Agent/TCPSink]
$ns attach-agent $r(0) $sink_tcp0

# create a TCP agent and attach it to node r5
set tcp0 [new Agent/TCP]

# caracteristics of agent tcp0
$tcp0 set class_ 1
$tcp0 set window_ 15
$tcp0 set packetSize_ 1000
$ns attach-agent $r(5) $tcp0


set ftp0 [new Application/FTP]
$ftp0 attach-agent $tcp0

$ns connect $tcp0 $sink_tcp0

#for {set i 1} {$i < 8} {incr i} {
#set udp($i) [new Agent/UDP]
#}

#for {set i 1} {$i < 8} {incr i} {
#$udp($i) set fid_ $i
#$ns attach-agent $r($i) $udp($i)
#$ns connect $udp($i) $sink0
#}

#for {set i 1} {$i < 8} {incr i} {
#set cbr($i) [new Application/Traffic/CBR]
#$cbr($i) attach-agent $udp($i)
#$cbr($i) set rate_ 0.50Mb
#$cbr($i) set packetSize_ 1000
#$cbr($i) set type_ CBR
#}

#Schedule events for the cbr agents
#for {set i 1} {$i < 8} {incr i} {
#$ns at 1.0 "$cbr($i) start"
#$ns at 10.0 "$cbr($i) stop"
#}
$ns at 1.0 "$ftp0 start"
#$ns at 1.0 "$cbr(5) start"


#Call the finish procedure 
$ns at 60.0 "finish"

#Run the simulation
$ns run
