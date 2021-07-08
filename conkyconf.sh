#!/bin/sh

# sh menu-conf.sh


defposition="Up"
defheight=26
defwidth=150
cores=`nproc`
resol=`xrandr | grep '*' | awk '{print $1}'`


setsystime="no" 
setsysinfo="no"

setcpugraph="no"
setcpucores="no" 
setcputop5="no"

setmemgraph="no"
setmeminfo="no"
setmemtop5="no"

sethddgraph="no"
sethddinfo="no"
sethddswap="no"

setnetgraph="no"
setnetinfo="no"
setnetip="no"

cpusetitems=5
memsetitems=5
netsetitems=5



start_conky ()
{

	echo "conky.config = {
    alignment = 'top_right',
    background = true,
    border_width = 1,
    cpu_avg_samples = 2,
	default_color = 'white',
    default_outline_color = 'green',
    default_shade_color = 'red',
    draw_borders = false,
    draw_graph_borders = true,
    draw_outline = false,
    draw_shades = false,
    use_xft = true,
    font = 'DejaVu Sans Mono:size=8',
    gap_x = 10,
    gap_y = 34,
    minimum_height = 1036,
	minimum_width = 150,
	maximum_width = 150,
    net_avg_samples = 2,
    no_buffers = true,
    out_to_console = false,
    out_to_stderr = false,
    extra_newline = false,
    own_window = true,
    own_window_class = 'Conky',
    own_window_type = 'normal',
	own_window_transparent = false,
	own_window_argb_visual = true,
	own_window_argb_value = 125,
	own_window_hints = 'undecorated,sticky,below,skip_taskbar,skip_pager',
	double_buffer = true,
    stippled_borders = 0,
    update_interval = 1.0,
    uppercase = false,
    use_spacer = 'none',
    show_graph_scale = false,
    show_graph_range = false,
	top_name_width = 12
}

conky.text = [[
" > $1

}

end_conky ()
{
	echo "]]" >> $1
}

sys_conky ()
{

echo "\${font DejaVu Sans Mono:Bold:Italic:size=12}\${color 00cccc}\$sysname" >> $1

}
systime_conky ()
{

echo "\$color\${font DejaVu Sans Mono:size=11}\${voffset -12}\$alignr\${time %H:%M:%S}
\$color\${font DejaVu Sans Mono:size=10}\${voffset -5 }\$alignr\${time %d %m %Y}" >> $1

}
sysinfo_conky ()
{

echo "\${font DejaVu Sans Mono:Bold:Italic:size=10}\${color aa0000}SYS \${hr 3}
\${font DejaVu Sans Mono:Bold:Italic:size=8}\${color orange}Users: \$alignr\$user_number / \${user_names}
Uptime: \$alignr \$uptime
Proces: \${alignr}\$processes / \$running_processes" >> $1

}

cpu_conky ()
{

echo "" >> $1

echo "# CPU
\${font DejaVu Sans Mono:Bold:Italic:size=10}\${color aa0000}CPU \${cpu cpu0}%
\${cpubar cpu0 4}\${font}" >> $1

}
cpugraph_conky ()
{

echo "\${font}\${color orange}\${cpugraph cpu0 30,150 570c0c 069496}" >> $1

}

cpucore_conky ()
{

for num in $(seq 1 $cores); do 
	echo "\${color red}\${cpu cpu$num}% \$alignr\${color yellow}\${hwmon 0 temp $(($num+1))}°C \$alignr\${color 00aaaa}\${cpubar cpu$num 4,80}" >> $1; 
done

}
cputop_conky ()
{

echo "#
\${font}\${color 00ffff}\${stippled_hr 1}" >> $1

#num=1; while [ $num -le $cpusetitems ]; do echo "\${top name $num}\${alignr}\${top cpu $num}%" >> $1; num=$(( $num + 1 )); done

for num in $(seq 1 $cpusetitems); do echo "\${top name $num}\${alignr}\${top cpu $num}%" >> $1; done

}


mem_conky ()
{

echo "" >> $1

echo "# MEM
\${font DejaVu Sans Mono:Bold:Italic:size=10}\${color aa0000}MEM \$memperc% 
\${membar 4}" >> $1

}
memgraph_conky ()
{

echo "\${font}\${color orange}\${memgraph 30,150 570c0c 069496}" >> $1

}
meminfo_conky ()
{

echo "\${font DejaVu Sans Mono:Bold:Italic:size=8}\${color red}\$mem\${color yellow} / \${color green}\$memeasyfree 
\${font}\${color yellow}\$buffers / \$cached" >> $1

}
memtop_conky ()
{

echo "\${font}\${color 00ffff}\${stippled_hr 1}" >> $1

# num=1; while [ $num -le $memsetitems ]; do echo "\${top_mem name $num}\${alignr}\${top_mem mem $num}%" >> $1; num=$(( $num + 1 )); done

for num in $(seq 1 $memsetitems); do echo "\${top_mem name $num}\${alignr}\${top_mem mem $num}%" >> $1; done

}

hdd_conky ()
{

echo "" >> $1

echo "# HDD
\${font DejaVu Sans Mono:Bold:Italic:size=10}\${color aa0000}HDD \${fs_used_perc}%
\${fs_bar 4 /}" >> $1

}
hddgraph_conky ()
{

echo "\${font}\${color orange}\${diskiograph /dev/sda 30,150 570c0c 069496}" >> $1

}
hddinfo_conky ()
{

echo "\${font DejaVu Sans Mono:Bold:Italic:size=8}\${color red}\${fs_used /}\${color yellow} / \${color green}\${fs_free /}
\${color ff00cc}WR: \${diskio_write /dev/sda}
\${color 00ffff}RD: \${diskio_read /dev/sda}" >> $1

}
hddswap_conky ()
{

echo "\${font DejaVu Sans Mono:Bold:Italic:size=10}\${color aa00cc}SWP \${swapperc}% \$alignr\${swapbar 4,80}" >> $1

}


net_conky ()
{

echo "" >> $1

echo "# NETWORK
\${font DejaVu Sans Mono:Bold:Italic:size=10}\${color aa0000}NET \${hr 3}\$font" >> $1

}
netgraph_conky ()
{

echo "\${color ff00cc}\${downspeedgraph enp2s0 20,70  570c0c 069496}\$alignr\${color 00ffff}\${upspeedgraph   enp2s0 20,70  570c0c 069496}" >> $1

}
netinfo_conky ()
{

echo "\${font DejaVu Sans Mono:Bold:Italic:size=8}\${color}↓ \${color ff00cc}\${downspeedf enp2s0}kb/s  \${color orange}\$alignr\${totaldown enp2s0}
\${font DejaVu Sans Mono:Bold:Italic:size=8}\${color}↑ \${color 00ffff}\${upspeedf enp2s0}kb/s  \${color orange}\$alignr\${totalup enp2s0}
#\${color orange}All: \${tcp_portmon 1 65535 count}  Out: \${tcp_portmon 32768 61000 count}\${alignr}In: \${tcp_portmon 1 32767 count}
#" >> $1

}
netip_conky ()
{

echo "\${font}\${color 00ffff}\${stippled_hr 1}
\$font\${color 00ffff}\${execi 2 netstat -tn | grep ESTAB | awk '{if ( NR < 22 ) {print \$5}}' | sort | uniq -c | sort -nr | sed 's/^ *//g;s/:/ /g'}" >> $1

}



##### Conky Panel #####

tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$

dialog --title " Configure: Conky Panel " \
		--radiolist "Conky Panel: position " 20 60 5 \
        "top_right"     "Conky Panel: Right" on \
        "top_left"      "Conky Panel: Left" off 2> $tempfile

retval=$?
setconkypos=`cat $tempfile`
rm -f $tempfile


tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$

dialog --title " Configure: Conky Panel " \
		--inputbox "Conky Panel: width" 10 60 "150" 2> $tempfile

retval=$?
setwidth=`cat $tempfile`
rm -f $tempfile


##### Desktop Panel #####

tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$

dialog --title " Configure: Desktop Panel " \
		--radiolist "Desktop Panel: position " 20 60 5 \
        "Up"        "Desktop Panel: Up" on \
        "Down"      "Desktop Panel: Down" off \
        "Two"       "Desktop Panel: Up & Down" off \
        "None"      "Desktop Panel: None / Hide" off 2> $tempfile

retval=$?
setposition=`cat $tempfile`
rm -f $tempfile


tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$

dialog --title " Configure: Desktop Panel " \
		--inputbox "Desktop Panel: height" 10 60 "26" 2> $tempfile

retval=$?
setheight=`cat $tempfile`
rm -f $tempfile



##### Network interface #####

tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$

nets=`ls -x /sys/class/net/`

dialog --title " Configure: Network interface " \
	--inputbox "Network interfaces: \n$nets" 10 60 "enp2s0" 2> $tempfile

retval=$?
setnet=`cat $tempfile`

rm -f $tempfile


##### System info #####

tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$

dialog --title " Configure: System info " \
		--checklist "System info" 20 60 5 \
        "Time"  "System Time" on \
        "Info"  "System info" on 2> $tempfile

setlistsys=`cat $tempfile`

for listsys in $setlistsys;
do 
	if [ $listsys = "Time" ]; then setsystime="yes"; fi;
	if [ $listsys = "Info" ]; then setsysinfo="yes"; fi;
done

rm -f $tempfile


##### Cpu info #####

tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$

dialog --title " Configure: Cpu info " \
		--checklist "Cpu info" 20 60 5 \
        "Graph"  "Cpu graph " on \
        "Usage"  "Each core" on \
        "Top"    "Cpu Top processes" on 2> $tempfile

setlistcpu=`cat $tempfile`

for listcpu in $setlistcpu;
do 
	if [ $listcpu = "Graph" ]; then setcpugraph="yes"; fi;
	if [ $listcpu = "Usage" ]; then setcpucores="yes"; fi; 
	if [ $listcpu = "Top"   ]; then setcputop5="yes";  fi; 
done

rm -f $tempfile


if [ $setcputop5 = "yes" ]
then   

tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$

dialog --title " Configure: Cpu info " \
		--inputbox "Cpu info: Top items" 10 60 "5" 2> $tempfile

retval=$?
cpusetitems=`cat $tempfile`
rm -f $tempfile

fi


##### Mem info #####

tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$

dialog --title " Configure: Mem info " \
		--checklist "Mem info" 20 60 5 \
        "Graph"  "Mem graph " on \
        "Usage"  "Mem usage / free" on \
        "Top"    "Mem Top processes" on 2> $tempfile

setlistmem=`cat $tempfile`

for listmem in $setlistmem; 
do 
	if [ $listmem = "Graph" ]; then setmemgraph="yes"; fi;
	if [ $listmem = "Usage" ]; then setmeminfo="yes";  fi; 
	if [ $listmem = "Top"   ]; then setmemtop5="yes";  fi; 
done

rm -f $tempfile

if [ $setmemtop5 = "yes" ]
then   

tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$

dialog --title " Configure: Mem info " \
		--inputbox "Mem info: Top items" 10 60 "5" 2> $tempfile

retval=$?
memsetitems=`cat $tempfile`
rm -f $tempfile

fi


##### Hdd info #####

tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$

dialog --title " Configure: Hdd info " \
		--checklist "Hdd info" 20 60 5 \
        "Graph"  "Hdd graph " on \
        "Usage"  "Hdd usage / free" on \
        "Swap"   "Hdd Swap" on 2> $tempfile

setlisthdd=`cat $tempfile`

for listhdd in $setlisthdd; 
do 
	if [ $listhdd = "Graph" ]; then sethddgraph="yes"; fi;
	if [ $listhdd = "Usage" ]; then sethddinfo="yes";  fi; 
	if [ $listhdd = "Swap"  ]; then sethddswap="yes";  fi; 
done

rm -f $tempfile


##### Net info #####

tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$

dialog --title " Configure: Net info " \
		--checklist "Net info" 20 60 5 \
        "Graph"  "Net graph " on \
        "Usage"  "Net speed / total" on \
        "Top"    "Net Top IP" on 2> $tempfile

setlistnet=`cat $tempfile`

for listnet in $setlistnet; 
do 
	if [ $listnet = "Graph" ]; then setnetgraph="yes"; fi;
	if [ $listnet = "Usage" ]; then setnetinfo="yes";  fi; 
	if [ $listnet = "Top"   ]; then setnetip="yes";    fi; 
done

rm -f $tempfile

if [ $setnetip = "yes" ]
then   

tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$

dialog --title " Configure: Net info " \
		--inputbox "Net info: IP items" 10 60 "22" 2> $tempfile

retval=$?
netsetitems=`cat $tempfile`
rm -f $tempfile

fi


##### Conky: Start / Restart #####

setrestart="no"

tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$

dialog --title " Conky: Start / Restart " \
       --yesno "Restart?" 10 40

case "$?" in
	'0')
		setrestart="yes"
	;;
esac

rm -f $tempfile


#hwmoninfo=`sh hwmon-info.sh`

#echo $hwmoninfo


##### All info #####

tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$

dialog --title " Configure: Set " \
	--msgbox "   Conky Panel: position = $setconkypos; width = $setwidth \n\n \
  Desktop Panel: position = $setposition; height = $setheight \n \
  Net interface: $setnet \n\n \
  Cpu: Graph = $setcpugraph; Usage = $setcpucores; Top  = $setcputop5 ( items = $cpusetitems ) \n \
  Mem: Graph = $setmemgraph; Usage = $setmeminfo; Top  = $setmemtop5 ( items = $memsetitems )\n \
  Hdd: Graph = $sethddgraph; Usage = $sethddinfo; Swap = $sethddswap \n \
  Net: Graph = $setnetgraph; Speed = $setnetinfo; Top  = $setnetip ( items = $netsetitems ) \n\n \
  Info Cores: $cores \n \
  Info Monitor: $resol \n \
  Conky: Start / Restart: $setrestart \n" 20 80 2> $tempfile

set_param ()
{
	# gap_x & gap_y
	offset=10

	resol=`xrandr | grep '*' | awk '{print $1}'`
	width=`echo $resol | awk '{split($0,a,"x"); print a[1]}'`
	height=`echo $resol | awk '{split($0,a,"x"); print a[2]}'`

	conky_height=$(($height-$setheight-$offset*2))
	conky_offset=$(($setheight+$offset))

	conky_width=$(($setwidth-70))
	conky_width_net=$(($setwidth/2-5))


	if [ $setposition = "Down" ]; then conky_offset=$offset; fi
	if [ $setposition = "Two"  ]; then conky_height=$(($height-$setheight*2-$offset*2)); fi
	if [ $setposition = "None" ]; then conky_height=$(($height-$offset*2)); conky_offset=$offset; fi

	sed "s|top_right|${setconkypos}|g" -i $1

	sed "s|gap_x = .*|gap_x = ${offset},|;s|gap_y = .*|gap_y = ${conky_offset},|" -i $1
	sed "s|minimum_height = .*|minimum_height = ${conky_height},|g" -i $1
	sed "s|minimum_width = .*|minimum_width = ${setwidth},|g;s|maximum_width = .*|maximum_width = ${setwidth},|g" -i $1
	sed "s|80|${conky_width}|g;s|150|${setwidth}|g" -i $1
	sed "s|enp2s0 20,70|enp2s0 20,${conky_width_net}|g" -i $1
	sed "s|enp2s0|${setnet}|g" -i $1
	sed "s|NR < 22|NR < ${netsetitems}|g" -i $1
}


	start_conky conky-gen.conf
	sys_conky conky-gen.conf
	if [ $setsystime = "yes" ]; then systime_conky conky-gen.conf; fi;
	if [ $setsysinfo = "yes" ]; then sysinfo_conky conky-gen.conf; fi;

	cpu_conky conky-gen.conf
	if [ $setcpugraph = "yes" ]; then cpugraph_conky conky-gen.conf; fi;
	if [ $setcpucores = "yes" ]; then cpucore_conky conky-gen.conf; fi;
	if [ $setcputop5  = "yes" ]; then cputop_conky conky-gen.conf; fi;

	mem_conky conky-gen.conf
	if [ $setmemgraph = "yes" ]; then memgraph_conky conky-gen.conf; fi;
	if [ $setmeminfo  = "yes" ]; then meminfo_conky conky-gen.conf; fi;
	if [ $setmemtop5  = "yes" ]; then memtop_conky conky-gen.conf; fi;

	hdd_conky conky-gen.conf
	if [ $sethddgraph = "yes" ]; then hddgraph_conky conky-gen.conf; fi;
	if [ $sethddinfo  = "yes" ]; then hddinfo_conky conky-gen.conf; fi;
	if [ $sethddswap  = "yes" ]; then hddswap_conky conky-gen.conf; fi;
	
	net_conky conky-gen.conf 
	if [ $setnetgraph = "yes" ]; then netgraph_conky conky-gen.conf; fi;
	if [ $setnetinfo  = "yes" ]; then netinfo_conky conky-gen.conf; fi;
	if [ $setnetip    = "yes" ]; then netip_conky conky-gen.conf; fi;

	end_conky conky-gen.conf

	set_param conky-gen.conf

	if [ $setrestart = "yes" ]; then killall conky; conky --config=conky-gen.conf; fi;