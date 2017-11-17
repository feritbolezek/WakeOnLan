# **WAKE ON LAN** - Turn on your computer remotely - Swift 4.0

This project was made to build a "magic-packet sender" in Swift. To test the project all you need to do is pass in values to the class MagicPacketSender.swift.

Here is a quick example:

```
let magicPacketSender = MagicPacketSender()

magicPacketSender.wakeMeUp(broadcastAddress: "192.168.0.255", macAddress: "44-AA-D5-BD-25-82")

```

> Make sure you check out the prerequisites for WakeOnLan(WOL) before you decide that it doesn't seem to wake up your PC.
> 
> Quick run-through of the prerequisites (make sure you google it anyways, it may change depending on hardware) :
> 
1. Make sure your computer supports WOL. If your computer has LED lights lit up on the motherboard while it's shut down, there is a great chance that it support WOL. Most modern computers support WOL. 
2. Enable WakeOnLan in your OS. 
3. Enable WakeOnLan in your BIOS settings. On MSI motherboards you may find this setting under Settings > Advanced > Wake Up Event Setup. Enable "Resume by PCI-E Device".
4. I'm not sure if you can find the broadcast address in the command prompt. If you can't find it, look for an online "broadcast address calculator" or calculate it yourself.

That is all there is, hope you find it useful!


## Extras

The project also includes some extras, i created a viewcontroller with some code for WOL to trigger once you get in range of an iBeacon. You can view the UI for it in the Main.storyboard. If you wish to use it, you will need an iBeacon with a UUID set to it. Feed in the UUID for the AwakeOnHomeVC to use. You can now power on your PC while you're parking at the garage!

Feel free to contact me regards any questions or to tell me about your usage of code. You may use the contents of the project for whatever you like. 😀👊🏻