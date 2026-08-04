# Guilty Devboard Xrd Documentation

Guilty Devboard Xrd is a XIAO nRF54LM20A clone(-ish). Its competition is of course the XIAO nRF54LM20A, but also, the XIAO nRF52840 Plus. This is because the former does not have its own built-in antenna, instead relying on an external antenna. While this is a reasonable choice, this makes it unsuitable as a perfect successor to the the XIAO nRF52840.

More to the point, these are the alternatives to the Xrd, which is *designed to be compatible with both*. You can replace essentially any XIAO nRF52840 Plus design with the Xrd and it should work perfectly, whereas for the XIAO nRF54LM20A most designs will work, the only issue being those relying on the last few GPIO pins.

![](/assets/docs/guilty-devboard-xrd/guilty-devboard-xrd.png)

## XIAO nRF52840 Plus comparison and compatibility

The XIAO nRF52840 Plus is a fairly basic board, and as such its capabilities are not only essentially fully cloned, but exceeded by Xrd. It is perfectly compatible with the nRF52840, but with the addition of 7 extra GPIO pins, a far higher current limit on the 3.3V pin, battery sensing that won't burn out, and up to ~7x faster charging (configurable to many different levels).

The only things the Xrd was not able to clone were the reset button, and the charging LED. I was unable to find a button that small (even the TS-1088 is far too large, and finding appropriate buttons for this stuff is surprisingly hard), so instead it's simply bridged with [twiizers](https://wiibrew.org/wiki/Fail0verflow), and the charge LED I simply do not care about, forgot existed, and cannot be bothered to add both because routing is pain, and because I do not want it regardless.

## XIAO nRF54LM20A comparison and compatibility

The XIAO nRF54LM20A is a very impressive board, however as previously mentioned, it is imperfect. It makes up for all the deficiencies (at least in my opinion) of the nRF52840 Plus, but adds its own in the lack of a chip antenna, and the guarantee on how much 3.3V power can be drawn (1A total, including the board itself).

The XIAO nRF54LM20A is *unquestionably a better board aside from that*. The XIAO nRF54LM20A has an additional 4 pads at the bottom, as well as an additional pad on the rear 8 - D14, which was planned but unfortunately was impossible (or at least impractical) to make room for given the manufacturing capabilities available.

![](/assets/docs/guilty-devboard-xrd/xiao-nrf54lm20a-bottom-pads.png)

Note: The pins on the Xrd are not the same, this board was mostly done with design by the time the XIAO nRF54LM20A was released, but they should have the same functions, at least for the most part.

## Manufacturing

It is recommended to get the PCB manufactured by JLCPCB (uses JLC0616H-3313), as well as getting a non-framework stencil and applying solder paste using a stencil printer such as the [JLC1010](https://jlcmc.com/product/b/L15/BR12406/smt-stencil-printing-suitable-for-100x100mm-stencils). Then use a pick and place machine (see [here](https://github.com/askiiart/the-claw-pnp)) to install the components, and reflow in an oven or on a hot plate, either should work as it's simple double-sided components (albeit quite precise).
