import numpy as np
import matplotlib.pyplot as plt

# All of this is based on the math in
# http://www.delta-line.com/data/download/Brush_DC_Motor_Basics.pdf
#
# Note unlike what we covered in E28, that document covers non-ideal
# efficiency curves due to no-load current Io.

# Define RPM as a global variable
RPM = np.pi/30
inch = 0.0254

MAKE_PLOT = False

if MAKE_PLOT:
    import matplotlib.pyplot as plt
    from mpl_toolkits.axes_grid1 import host_subplot
    import mpl_toolkits.axisartist as AA


######################################################################
# Given parameters:
#
#   operating voltage V (Volts)
#   no-load speed Wmax (rad/s)
#   stall torque Ts (Nm)
#   no-load current Is (A)
#
# Compute the motor constant k (V*s) and resistance R (Ohm)

def compute_kr(V, Wmax, Ts, Io=0):

    if Io == 0:

        k = V/Wmax
        R = k*V/Ts

    else:

        k = (-Ts*Wmax + np.sqrt(Ts*Wmax*(4*Io*V + Ts*Wmax)))/(2*Io*Wmax)
        R = (2*Io*V + Ts*Wmax - np.sqrt(Ts*Wmax*(4*Io*V + Ts*Wmax)))/(2*Io**2)

        return k, R

######################################################################
# Plot motor specs to see if they match the datasheet

def plot_specs(V, k, R, Io):

    # Make sure that the stall torque and max speed are expected
    Ts = k*(V/R - Io)
    Wmax = (V-Io*R)/k
    print 'recovered Wmax={} RPM, Ts={} Nm'.format(Wmax/RPM, Ts)

    # Check out max efficiency
    Is = V/R # stall current (A)
    nmax = (1 - np.sqrt(Io/Is))**2
    print 'max efficiency is {:.2f}%'.format(nmax*100)

    T = np.linspace(0, Ts, 500)
    I = T/k + Io # motor current (A) from PDF above
    w = (V - Io*R)/k - T*R/k**2
    Pe = V*I
    Pm = T*w
    n = Pm/Pe

    # Plotting code cribbed from demo at
    # http://matplotlib.org/examples/axes_grid/demo_parasite_axes2.html
    host = host_subplot(111, axes_class=AA.Axes)
    plt.subplots_adjust(right=0.75)

    par1 = host.twinx()
    par2 = host.twinx()
    par3 = host.twinx()

    offset1 = 50
    offset2 = 100

    new_fixed_axis = par2.get_grid_helper().new_fixed_axis

    par2.axis["right"] = new_fixed_axis(loc="right",
                                        axes=par2,
                                        offset=(offset1, 0))

    par2.axis["right"].toggle(all=True)

    par3.axis["right"] = new_fixed_axis(loc="right",
                                        axes=par3,
                                        offset=(offset2, 0))

    par3.axis["right"].toggle(all=True)

    host.set_xlim(0, 0.62)
    host.set_ylim(0, 4000)
    host.grid(True)

    host.set_xlabel("Torque (Nm)")
    host.set_ylabel("Speed (RPM)")
    par1.set_ylabel("Current (A)")
    par2.set_ylabel("Power (W)")
    par3.set_ylabel("Efficiency (%)")

    p1, = host.plot(T, w/RPM, 'k')
    p2, = par1.plot(T, I, 'r')
    p3, = par2.plot(T, Pm, 'b')
    p4, = par3.plot(T, n*100, 'g')

    par1.set_ylim(0, 10)
    par2.set_ylim(0, 150)
    par3.set_ylim(0, 100)

    host.axis["left"].label.set_color(p1.get_color())
    par1.axis["right"].label.set_color(p2.get_color())
    par2.axis["right"].label.set_color(p3.get_color())
    par3.axis["right"].label.set_color(p4.get_color())

    plt.draw()
    plt.savefig('specs.pdf')
    print 'saved to specs.pdf'


def main():

    # Parameters of Ampflow M27-150 motor:
    Wmax = 3800*RPM
    Ts = 1.9
    V = 24
    Io = 0.4

    # Get k & R
    k, R = compute_kr(V, Wmax, Ts, Io)
    print 'solved k={} V*s, R={} ohm'.format(k, R)

    if MAKE_PLOT:
        plot_specs(V, k, R, Io)
    else:
        print 'skipping plotting...'

    print

    # Other parameters
    r = 5 * inch # Wheel radius (m)
    G = np.linspace(5, 30, 1000) # Gear ratio
    # G = 9
    g = 9.81 # accel. gravity (m/s^2)

    # Each scenario is a mass, slope, combination
    scenarios = [
        # (20, 0),
        (20, 15),
        (70, 0),
        (70, 15),
    ]

    # Our mechanical power from the motor is going to be
    # equal to T*w (torque * speed)
    #
    #   Pm = T*w
    #
    # But remember w is defined by linear relationship:
    #
    #   w = Wmax - T*(Wmax/Ts)
    #
    # Our lifting force is
    #
    #   Fl = m*g*sin(theta)
    #
    # Note that linear velocity is wheel velocity (w/G) times wheel
    # radius (r)
    #
    #   v = w*r/G
    #
    # So our lifting power (per wheel, so divide by 2) is
    #
    #   Pl = (Fl * v) / 2
    #
    # We assume losses due a frictional torque (Tf) proportional to
    # the wheel rotation speed (w/G) with damping constant B
    #
    #   Tf = B * w/G
    #
    # The power dissapated by frictional losses is the torque times
    # wheel speed:
    #
    #   Pf = Tf * w/G = B * (w/G)^2
    #
    # Now we will solve for the equilibrium torque T that balances the
    # power equation:
    #
    #   Pm = Pf + Pl
    #
    # print 'assuming r={} m and G={}:1'.format(r, G)
    # print
    # f = plt.figure()
    plt.subplot(3, 5, 1)
    curr_plot = 0
    for m, theta_deg in scenarios:

        theta = theta_deg*np.pi/180 # slope in rad
        Fl = m*g*np.sin(theta) # lifting force in N

        # print 'for m={} kg, theta={} deg, Fl={} N'.format(m, theta_deg, Fl)
        # print

        for B in (0.002, 0.005, 0.01, 0.05, 0.1):

            # Compute torque to reach equilibrium (Nm)
            # I used sympy to solve for this
            T = Ts*(Fl*G*r + 2*Wmax*B)/(2*(G**2*Ts + Wmax*B))

            # Compute current (A)
            I = T/k + Io

            # Motor angular velocity (rad/s)
            w = Wmax - T*(Wmax/Ts)

            # Robot linear velocity (m/s)
            v = w*r/G

            # Compute power both ways (should be equal)
            Pm1 = T*w
            Pm2 = Fl*v/2 + B*(w/G)**2

            Pe = V*I
            n = Pm1/Pe

            # plot the subplot
            curr_plot += 1
            plt.subplot(3, 5, curr_plot)

            plt.title('m = {}, slope = {}, B = {}'.format(m, theta_deg, B))
            plt.plot(G, n)


        #     print '  with B={:.2f}, T={:.2f} Nm, w={:.0f} RPM, v={:.2f} m/s, Pm={:.0f} W (err={:.2f} W), n={:.1f}%'.format(
        #         B, T, w/RPM, v, Pm1, abs(Pm1-Pm2), 100.0*n)
        #
        # print

    # plt.savefig( 'motor_modeling.png', orientation = 'landscape', papersize = 'letter')
    plt.subplots_adjust(left = 0.05, right = .95, bottom = 0.05, top = .95,
        hspace = .2, wspace = .2)
    plt.show()
    plt.close()
if __name__ == '__main__':
    main()
