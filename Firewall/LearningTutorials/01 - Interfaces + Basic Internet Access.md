
Now that we have access to the management interface, let's see what we can do with it. 

Firewalls like the Palo Alto are very different from the routers and switches that you may know already. With switches, you plug your cables into the interfaces and it kind of just works. Routers are a bit more compliated, but once you have requisite information provided (like a default gateway and an external IP,) plugging in the cables usually means the router just works. 

This isn't the case with the Palo Alto. Interfaces in the Palo Alto can be assigned to fit a number of purposes and have to be manually configured, so don't be surprised when you plug your laptop into the PA and don't have internet. Below are the options interfaces can be set to along with brief explanations. Full credit to [Firewall.cx](https://www.firewall.cx/security/palo-alto-networks/palo-alto-deployment-modes.html) for the wonderful explanation and illustrations.

1. **Tap** - When you think "LAN tap," this is it. Taps were originally physical devices that could be clamped onto ethernet cables, allowing for observance and collection of traveling packets through the cable. In a similar way, the Palo Alto interfaces can be set in Tap mode. By doing so, the interface is expecting to *recieve traffic to monitor.* No traffic will be *output* on a Tap interface. Below is an example setup of a Tap interface.

![Example Tap interface setup](https://www.firewall.cx/images/stories/palo-alto-deployment-modes-1.png)

  "The advantage of this deployment model is that it allows organizations to closely monitor traffic to their servers or network without requiring any changes to the network infrastructure. During the configuration of SPAN it is important to ensure the correct SPAN source and SPAN Destination ports are configured while also enabling Tap mode at the Firewall. Tap mode offers visibility of application, user and content, however, we must be mindful that the firewall is unable to control the traffic as no security rules can be applied in this mode. Tap mode simply offers visibility in the ACC tab of the dashboard. The catch here is to ensure that the tap interface is assigned to a security zone."

2. **Virtual Wire** - The Virtual Wire interface is similar to the Tap interface. Instead of configuring one port to only recieve traffic, two ports are configured and linked to one another. By doing so, a "virtual cable" or "virtual wire" is created that monitors traffic flowing between the two ports. By creating a virtual wire, the Palo Alto essentially acts as a "man-in-the-middle" that can monitor traffic. However, the catch here is that while a Tap interface can only monitor traffic, a Virtual Wire interface can **also apply rules and control traffic crossing the wire** due to one interface recieving traffic and the other sending traffic.

![Example Virtual Wire interface setup](https://www.firewall.cx/images/stories/palo-alto-deployment-modes-2.png)

3. **Layer 2** - The Layer 2 interface allows the Palo Alto to act as a switch between network segments. All attached computers to Layer 2
4. **Layer 3** - Todo

These interfaces help us learn more about setting up. (TODO make this more detailed and finish it)
1. Create the interfaces you want to use
2. Create security zones
3. Create a virtual router to route traffic between the zones
5. Create a default route for traffic leaving the network defined by the virtual router
6. Create a DHCP server on the firewall. Set it to auto
7. Create a NAT policy to translate internal addresses to external address
8. Create security rule. Traffic will NOT flow without a rule.

Something interesting is that Palo Alto is a stateful firewall. This means that when a connection is made from inside the firewall to out, a response is expected and stored. This keeps internal machines safer because malformed responses can't be sent without a internal request being sent first (possibly Layer 5.) The PA being stateful is the reason why we only need to create NAT and rules for egress traffic, but not for ingress - rules are applied based on the orgin, not only on the direction of traffic flow.
