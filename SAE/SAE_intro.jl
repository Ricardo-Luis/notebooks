### A Pluto.jl notebook ###
# v0.19.19

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ f2fa4e71-7d70-4d77-b03c-bba49b34b431
begin
	using PlutoUI # Pluto.jl user-interface
	using ShortCodes# for citations
	using PlutoTeachingTools
	using DifferentialEquations, Plots, LinearAlgebra, CSV, DataFrames# for Simple Climate Model
end

# ╔═╡ e58400d8-e6d8-4293-86f3-e71e3326db68
ThreeColumn(md"`SAE_intro.jl`", md"[![](https://img.shields.io/badge/GitHub_URL-notebook-C09107)](https://github.com/Ricardo-Luis/notebooks/blob/main/SAE/SAE_intro.jl)", md"`Last update: 02·03·2023`")

# ╔═╡ f2f363f7-7755-4d5d-8112-5ddd20bb5278
md"""
 ---
"""

# ╔═╡ 1d751412-66a2-4165-b6b9-343560203fa4
md"""
**Choose display mode:** $(ChooseDisplayMode())
\
\
"""

# ╔═╡ d70c1e41-e3ba-42f4-ac13-a0c9071882b6
md"""
# Introduction 
"""

# ╔═╡ 657a8e78-0781-41af-b421-824925f1fec1


# ╔═╡ b93be387-bcdf-4d81-ad7d-173b4b62cad9
md"""
## Why we need Energy Storage?
"""

# ╔═╡ f0144fbc-4732-414b-a6ca-6e7b172a0e68
md"""
Energy storage is an essential enabler of the **energy transition**. In the past decades, Europe has shifted from an energy system dominated by centralised fossil fuel generation that can be dispatched to match energy consumption at all times, to a system with more and more renewables.

The energy transition is a pathway toward transformation of the global energy sector from fossil-based to zero-carbon by the second half of this century. [^1][^2]

"""

# ╔═╡ ad3eddd5-5ded-41f2-819d-14d28265df3c


# ╔═╡ e47cff1d-429d-448c-a66a-2a95d5b86975
md"""
### Climate change (the Paris Agreement)
**Action to reduce the impact of climate change is critical.**

The Paris Agreement sets a goal to limit the increase in global average temperature to well below $$2\rm °C$$ above pre-industrial levels and to attempt to limit the increase to $$1.5\rm °C$$. Implicit in these goals is the need for a transition to a low-carbon energy sector, which accounts for two-thirds of global emissions. Renewable Energy, coupled with energy efficiency gains, can provide $$90\%$$ of the $$CO_2$$ emissions reductions needed by $$2050$$. 

_in  UN Climate Change Conference (COP21), Paris, France, 12 December 2015._ [^3]


"""

# ╔═╡ 456a7520-13b3-4bea-a121-b499612d4e65
md"""
![](https://i.imgur.com/VsGNeBR.png)
> Source: The Washington Post\Climate Lab, [^4]
"""

# ╔═╡ a25c910d-6b31-4359-8a80-8fc56cdc6cd3


# ╔═╡ 0c82bab4-6145-49eb-8140-b18d4b488b7e
md"""
### SDG 7: Affordable and clean energy

Sustainable Development Goals (SDGs)\
**ENSURE ACCESS TO AFFORDABLE, RELIABLE, SUSTAINABLE AND MODERN ENERGY FOR ALL:**
Renewable energy solutions are becoming cheaper, more reliable and more efficient every day. Our current reliance on fossil fuels is unsustainable and harmful to the planet, which is why we have to change the way we produce and consume energy. Implementing these new energy solutions as fast as possible is essential to counter climate change, one of the biggest threats to our own survival.

![](https://i.imgur.com/wCrX9in.png)

> Source: globalgoals.org, [^5].
"""

# ╔═╡ 106d22f6-df56-44c1-9eab-9af1ba1c2b5f


# ╔═╡ e8d9e8e3-6ff2-4c27-a149-d44b94e5430c
md"""
## Overview of GHG emissions
"""

# ╔═╡ d67fa2c0-ec8b-4294-a26b-3d57311faf67
md"""
**Overview of emission mitigation options and their cost and potential for the year 2030**
"""

# ╔═╡ 2181d8f8-8a61-47bc-97d8-3747c4c824dc


# ╔═╡ 28a79ac0-ee6a-46d6-aed6-80842990cdd4
md"""
**Trends of GHG emissions by sectors 1990–2019**

![](https://i.imgur.com/oFwTeZ1.png)

> Source: Extracted from IPCC 2022 report, Climate Change 2022: Mitigation of Climate Change.[^6]
\
"""

# ╔═╡ 93d0f231-077f-439c-84b1-e6408272fab2
md"""
**Trends and drivers of global energy sector emissions with energy measured as primary energy supply**

![](https://i.imgur.com/gRJ1Xzi.png)

> Source: Extracted from IPCC 2022 report, Climate Change 2022: Mitigation of Climate Change.[^6]
\
"""

# ╔═╡ 8fad238e-5ebc-4f92-95e7-09b6f6b2ec48
md"""
**Trends and drivers of global industry sector emissions with energy measured as total final energy consumption**

![](https://i.imgur.com/p9fxpo6.png)

> Source: Extracted from IPCC 2022 report, Climate Change 2022: Mitigation of Climate Change.[^6]
\
"""

# ╔═╡ fb8f4d3f-6480-4599-a311-f534cd134fff
md"""
**Trends and drivers of global buildings sector emissions with energy measured as total final energy consumption**

![](https://i.imgur.com/PcM5qtY.png)

> Source: Extracted from IPCC 2022 report, Climate Change 2022: Mitigation of Climate Change.[^6]
\
"""

# ╔═╡ e0dac55f-70a2-4035-822f-8f26c6d2106d
md"""
**Trends and drivers of global transport sector emissions with energy measured as total final energy consumption**

![](https://i.imgur.com/UqaT78o.png)

> Source: Extracted from IPCC 2022 report, Climate Change 2022: Mitigation of Climate Change.[^6]
\
"""

# ╔═╡ 25422eb4-46da-4f81-8d65-03ad8913ec9d
md"""
**AFOLU global GHG emission trends by subsectors**

![](https://i.imgur.com/dKnes1E.png)

> Source: Extracted from IPCC 2022 report, Climate Change 2022: Mitigation of Climate Change.[^6]
\
"""

# ╔═╡ a1f8d1ba-26bc-4a37-a793-25b87101ec4c


# ╔═╡ 3fa02153-ac79-448e-8b35-39fad81abacb
md"""
## Mitigation options
"""

# ╔═╡ f4577e3f-5204-4e5c-879f-05907226225b
md"""
![](https://i.imgur.com/dchnid1.png)

> Source: Extracted from IPCC 2022 report, Climate Change 2022: Mitigation of Climate Change.[^6]

**Note:**  The mitigation potential of each option is the quantity of net greenhouse gas emission reductions that can be achieved by a given mitigation option relative to specified emission baselines that reflects what would be considered current policies in the period 2015–2019. Mitigation options may overlap or interact and cannot simply be summed together. The potential for each option is broken down into cost categories (see legend). Only monetary costs and revenues are considered. If costs are less than zero, lifetime monetary revenues are higher than lifetime monetary costs. For wind energy, for example, negative cost indicates that the cost is lower than that of fossil-based electricity production. The error bars refer to the total potential for each option. The breakdown into cost categories is subject to uncertainty. Where a smooth colour transition is shown, the breakdown of the potential into cost categories is not well researched, and the colours indicate only into which cost category the potential can predominantly be found in the literature.
"""

# ╔═╡ eea251fa-8c1b-4d4e-ba39-4896461dc3f9


# ╔═╡ 38c749e0-f82c-431c-a31a-ca22846709bc
md"""
## Rare earth elements
"""

# ╔═╡ 0038fef7-4bd3-4b32-8509-b153e8a5a655
md"""
![](https://i.imgur.com/PHtGNaa.png)

> Source: Australian Rare Earths website, [^7]
\
"""

# ╔═╡ 1667cfcb-1c57-42f0-9e16-dc26829b58ca
WebPage("http://www.chemicalelements.com/groups/rareearth.html")

# ╔═╡ b20f4fb2-d31c-4442-b8be-219eb5d41cf0


# ╔═╡ fedd0e5b-7d0a-48c7-92b5-66dd45a9051b
md"""
![](https://i.imgur.com/VvhfhZW.png)

> Source: Study on the EU's list of Critical Raw Materials (2020), [^8]
\
"""

# ╔═╡ f50caa50-8f79-498d-a60f-9f5509c99923
md"""
**Highlights of the article of journalist Isabel Lopes Cardoso**, [^9]
"""

# ╔═╡ e9d627f3-0466-472f-9e3e-dad738790bfb
Foldable("Terras Raras: uma questão ambiental ou de defesa dos direitos humanos?",md"

- **Geopolitical Questions**\
  The current Chinese monopoly: today, China holds not only the global monopoly on the supply of rare earths, but the technological expertise and know-how needed to produce the most sophisticated technologies crucial to the energy transition.

- **Environmental Issues**\
  Rare earth extraction and refining processes are immensely damaging to the environment, as they produce high levels of toxic waste with major risks of radioactivity. The refining of one metric ton of rare earths produces 2000 metric tons of untreated toxic waste.


- **European Union: a stance of climate hypocrisy?**\
  Many have accused the European Union of showing climate hypocrisy, a “Not in my backyard” approach, of wanting to profit from the benefits of the energy transition while not wanting to bear the environmental consequences inherent in the development of certain processes necessary to the energy transition, such as mining.


- **The rare earths industry and the Social Problems**
  - China and ethnic homogenization
  - The rare earths industry and the violation of human rights


- **Rare Earths Recovery and Recycling: secondary sources**\
  One of the solutions that has been found is the implementation of the circular economy concept to the production of rare earths through waste management and the creation of a market for secondary raw materials, in this case rare earths, focusing on the recovery of rare earths from secondary sources.


- **The need for mining: primary sources**\
  Given the exponential demand for rare metals, and the present and future needs for rare earths, and considering the European Union’s current supply capacity, it is necessary to rethink the sources of rare earths supply, since the European Union cannot just survive on the market for rare earth secondary raw materials without digging mines.\


- **The urgency to rethink the energy mix**


- **The power of the consumer and the main critical matter**\
   The sustainability of a product does not come for free, and as seen, the extraction and processing of rare earths produces an environmental footprint, and European consumers should and can be in a position to make informed purchasing decisions through tools that help them ensure the transparency of value chains and compliance with environmental and social standards.

")

# ╔═╡ 31062028-878c-410b-af15-1cd51496c2aa


# ╔═╡ 55520238-9960-4705-b3c4-dfb32544aaf7
md"""
## Energy systems
"""

# ╔═╡ 361e618a-bcb4-41c5-9476-bd737434a197
md"""
**Global energy flows within the 2019 global energy system (top panel) and within two illustrative future, net-zero CO2 emissions global energy systems (bottom panels)**

![](https://i.imgur.com/wqdvwyX.png)

![](https://i.imgur.com/agRyOFC.png)

> Source: Extracted from IPCC 2022 report, Climate Change 2022: Mitigation of Climate Change.[^6]
\
"""

# ╔═╡ 78294055-989f-4094-a78d-643b0554781d
md"""
**Interaction between different energy sectors**

![](https://i.imgur.com/rwMUeD1.png)

> Source: Extracted from IPCC 2022 report, Climate Change 2022: Mitigation of Climate Change.[^6]
\
"""

# ╔═╡ 5ea8dcc5-712b-442a-bbe7-f20700b7a813
md"""
**Hydrogen value chain**

![](https://i.imgur.com/npZbg21.png)

> Source: Extracted from IPCC 2022 report, Climate Change 2022: Mitigation of Climate Change.[^6]

**Note:** Hydrogen can be produced by various means and input and fuel sources. These processes have different emissions implications. Hydrogen can be transported by various means and in various forms, and it can be stored in bulk for longer-term use. It also has multiple potential end uses. CHP: Combined heat and power.
\
"""

# ╔═╡ 4956acb8-ba62-4975-9577-23428647674a
md"""
**Schematic of net-zero emissions energy system, including methods to address difficult-to-electrify sectors**

![](https://i.imgur.com/OXjiCXG.png)

> Source: Extracted from IPCC 2022 report, Climate Change 2022: Mitigation of Climate Change.[^6]
\
"""

# ╔═╡ b595ea3e-4718-4b11-a1b1-18fcf21840e2


# ╔═╡ 058e0701-7fe4-457c-a0f4-578d8fab7d01
md"""
## Transport
"""

# ╔═╡ 20dd95cc-c67d-4c6c-ad67-d421c058945f
md"""
**Energy pathways for low-carbon transport technologies**

![](https://i.imgur.com/RLnVgl6.png)

> Source: Extracted from IPCC 2022 report, Climate Change 2022: Mitigation of Climate Change.[^6]

**Note:** Primary energy sources are shown in the far left, while the segments of the transport system are in the far right. Energy carriers and vehicle technologies are represented in the middle. Primary pathways are shown with solid lines, while dotted lines represent secondary pathways.
\
"""

# ╔═╡ 5fdad0a6-be84-4e6e-a3a4-dde625ea8ac5


# ╔═╡ 2c2bd5f6-2850-4f65-946e-fd6f7da0c3f2
md"""
# Simple climate model 💻
"""

# ╔═╡ d7fcead1-ed6f-4bf7-872f-560bc3d2a389
md"""
> This section about the "simple climate model" was extracted and slightly changed from the lesson of Prof. Alan Edelman, in **Introduction to Computational Thinking** course, MIT, spring 2021, [^10].
"""

# ╔═╡ 406d442d-e205-4ae5-b109-3122e341d5b6


# ╔═╡ 9169bbcc-b02d-4ed1-9582-d739a8a6a7ed
md"""
## Climate physics

The simplest climate model can be conceptualized as:\

$\begin{align}
\text{\color{brown}{change in heat content}} = & + \text{\color{orange}{absorbed solar radiation (energy from the Sun's rays)}} \newline
& - \text{\color{blue}{outgoing thermal radiation (i.e. blackbody cooling to space)}}
\newline
& + \text{\color{grey}{human-caused greenhouse effect (trapped outgoing radiation)}}
\end{align}$

where each of these is interpreted as an average over the entire globe (hence "zero-dimensional").
"""

# ╔═╡ c4b31e49-b2f9-4c91-9cbd-613952faa618
html"""<img src="https://raw.githubusercontent.com/hdrake/hdrake.github.io/master/figures/planetary_energy_balance.png" height=300>"""

# ╔═╡ 8437a02a-6a6b-47d0-a688-c91d40bc366b


# ╔═╡ 0aa1f79d-d610-43d1-989b-8a38499cd61c
md"""
### Incoming 🌞: Absorbed solar radiation
"""

# ╔═╡ 46355813-921b-49a5-b280-12e8e3dbcf13
md"""

In this heating earth example, the following quantities are identified:

- Industrial Revolution Start: $$1850$$
- Average Temperature in $$1850$$: $$14.0 \rm{°C}$$
- Solar Insolation: $$S=1368 \rm{W/m^2}$$  (energy from the sun)
- Albedo or planetary reflectivity: $$α = 0.3$$
- Atmosphere and upper-ocean heat capacity: $$C= 51 \rm{J/m^2/°C}$$ 
"""

# ╔═╡ 948a0225-036e-4861-ad83-54e5005ee15e
md"""

At Earth's orbital distance from the Sun, the power of the Sun's rays that intercept the Earth is equal to
"""

# ╔═╡ 43e71015-485a-434d-a46b-bfc97677501b
S = 1368; # solar insolation [W/m^2]  (energy per unit time per unit area)

# ╔═╡ 493195d1-4a1f-436c-ad3f-f02f0d41605e
md"A small fraction"

# ╔═╡ ffd12e6f-36d3-4bde-be44-44080e79dc54
α = 0.3; # albedo, or planetary reflectivity [unitless]

# ╔═╡ ab3b7a43-2b62-4672-afd3-3183230b1d51
md"""
of this incoming solar radiation is reflected back out to space (by reflective surfaces like white clouds, snow, and ice), with the remaining fraction $(1-\alpha)$ being absorbed.

Since the incoming solar rays are all approximately parallel this far from the Sun, the cross-sectional area of the Earth that intercepts them is just a disc of area $\pi R^{2}$. Since all of the other terms we will consider act on the entire surface area $4\pi R^{2}$ of the spherical Earth, the absorbed solar radiation *per unit surface area* (averaged over the entire globe) is reduced by a factor of 4.

"""

# ╔═╡ fdd6d5b5-4907-4ed8-9a86-191ec9014189
html"""<img src="https://www.open.edu/openlearn/ocw/pluginfile.php/101161/mod_oucontent/oucontent/890/639dcd57/ce3f1c3a/s250_3_002i.jpg" height=400>"""

# ╔═╡ fd1f811f-ba33-4087-ad42-f1a93ebad1ca
md"""
The absorbed solar radiation per unit area is thus

$\textcolor{orange}{\text{absorbed solar radiation} \equiv \frac{S(1-\alpha)}{4}}$
"""

# ╔═╡ 1bc57f89-ac95-4c14-95fd-87e66a23e314
absorbed_solar_radiation = S*(1 - α)/4 # [W/m^2]

# ╔═╡ c50f7a49-c029-4f9c-b96b-1d2b49b48bc4
begin
	C = 51.; # atmosphere and upper-ocean heat capacity [J/m^2/°C]
	temp₀ = 14.0 # preindustrial temperature [°C]
end;

# ╔═╡ 2d82156f-2383-4e11-bd25-f206e28b1465
md"""
The heat content $C temp$ is determined by the temperature $temp$ and the heat capacity of the climate system. While we are interested in the temperature of the atmosphere, which has a very small heat capacity, its heat is closely coupled with that of the upper ocean, which has a much larger heat capacity.
"""

# ╔═╡ de12117a-fc0d-4a4a-a2ed-4f9fc19867cf
md"""
The *change in heat content over time* is thus simply given by $\frac{d(Ctemp)}{dt}$. Since the heat capacity of sea water hardly changes with temperature, we can rewrite this in terms of the change in temperature with time as:

$\color{brown}{\text{change in heat content } =\; C \frac{dtemp}{dt}}$
"""

# ╔═╡ af169021-d62e-4b37-85ed-23aa98d80beb
md"""
Earth heating formula: \
$C\frac{d temp}{d t}=\frac{S(1-\alpha)}{4}=$ $(S*(1-α)/4)

"""

# ╔═╡ b64d90c3-6797-41df-8ae7-77f1e70fa436
p1 = ODEProblem( (temp, p, t)-> (1/C) * absorbed_solar_radiation, temp₀,  (0.0, 170) )

# ╔═╡ c6b0351e-1e79-4f88-b171-5d3f776a7709
md"""
**(Heating the earth nonstop)**
"""

# ╔═╡ 6fe6666b-622e-4e1f-8bcd-254fcb264bb0
begin
	plot(solve(p1),       legend = false, 
		 #background_color_inside = :black,
		                  xlabel = "years from $(1850)",
	                      ylabel = "Temperature °C", lw=2)
	hline!( [temp₀,temp₀] ,c=:red,ls=:dash, lw=2)
	annotate!( 80, 25+temp₀, text("Preindustrial Temperature = $(temp₀)°C",color=:black))
	title!("Absorbing Solar Radiation (only)")
end

# ╔═╡ 7db9d8fb-55cd-429d-b62e-bbadb1b54d25


# ╔═╡ 372f6169-2c73-4652-b767-80952b74ec0f
md"""
### Outgoing ♨ : thermal radiation
"""

# ╔═╡ dababbc3-b8f5-42fb-86b1-ae51bba83bc9
md"""

The outgoing thermal radiation term $\mathcal{G}(T)$ (or "blackbody cooling to space") represents the combined effects of *negative feedbacks that dampen warming*, such as **blackbody radiation**, and *positive feedbacks that amplify warming*, such as the **water vapor feedback**.

Since these physics are too complicated to deal with here, we *linearize* the model
combining the incoming and the outgoing.  

We assume that the preindustrial world was in energy balance, and thus
the equilibrium temperature is the preindustrial temperature.


Thus we assume \
$\frac{dtemp}{dt}=B(temp(0)-temp(t))\quad$ for some value of $B$.\
The minus sign in front of temp(t) indicating it restores equilibrium.
"""

# ╔═╡ 305710a5-aba1-470b-b47b-281c9391952c
md"""
The value that has been chosen, based on fitting data is
"""

# ╔═╡ 33812516-1ad5-49af-a82c-65bc9897908b
B = 1.3; # climate feedback parameter [W/m^2/°C],

# ╔═╡ 2840ec61-24bb-473e-a47e-e6665b4789d1
md"""
start\_temp = $(@bind start_temp Slider(0:30; show_value=true, default=14))
"""

# ╔═╡ e7a5458c-e091-4fbc-80d6-278462a64805
p2 = ODEProblem( (temp, p, t)-> (1/C) * B * (temp₀-temp), start_temp,  (0.0, 173) )

# ╔═╡ 798d013e-2eb7-4f57-b7a8-064533e81952
begin
	plot(solve(p2),       legend = false, 
		 #background_color_inside = :black,
		                  xlabel = "years from 1850",
	                      ylabel = "Temperature °C",
	                      ylim = (0, 30),
						  lw=2)
	hline!( [temp₀,temp₀] ,c=:red,ls=:dash, lw=2)
	annotate!( 80, temp₀, text("Preindustrial Temperature = $(temp₀)°C",:bottom,color=:black))
	title!("Energy Balance Model (Healthy Earth)")
end

# ╔═╡ 9f3f1ed6-8ce0-45d2-9e3b-53c959acb209


# ╔═╡ e8b2e939-f875-403c-9747-f496a7a00f22
md"""
### Greenhouse 🏭: Human-caused greenhouse effect

Empirically, the greenhouse effect is known to be a logarithmic function of gaseous carbon dioxide (CO₂) concentrations

$\color{grey}{\text{human-caused greenhouse effect}\; = {\mbox {(forcing\_coef)}} \ln \left( \frac{[\text{CO}₂]}{[\text{CO}₂]_{\text{PreIndust}}} \right),}$

How this depends on time into the future depends on human behavior!
Time is not modelled in the above equation. Where:
"""

# ╔═╡ 40da337a-6071-43bb-9450-8d67e0f18802
forcing_coef = 5.0; # CO2 forcing coefficient [W/m^2]

# ╔═╡ 8e6def94-39b2-457a-b7fc-7e19671fea1a
CO₂_PreIndust = 280.; # preindustrial CO2 concentration [parts per million; ppm];

# ╔═╡ b18f5942-f941-4a23-96a8-013de739ab10
greenhouse_effect(CO₂) = forcing_coef * log(CO₂/CO₂_PreIndust);

# ╔═╡ e481f231-c4e9-477d-aab0-a72ee184f8c9
begin
	CO2_present = 420.
	CO2_range = 280*(2 .^(range(-1, stop=3,length=100)))
	plot(CO2_range, greenhouse_effect.(CO2_range), lw=2.5, 
		label=nothing, color=:black)
	plot!([CO₂_PreIndust], [greenhouse_effect(CO₂_PreIndust)], marker=:circle, ms=6, 
		linecolor=:white, color=:blue, lw=0, label="pre-industrial (PI)")
	plot!([CO2_present], [greenhouse_effect(CO2_present)], marker=:circle, ms=6, 
		color=:red, linecolor=:white, lw=0, label="present day (2020)")
	plot!(xticks=[280, 280*2, 280*4, 280*8], legend=:bottomright, size=(600, 350))
	plot!(ylabel="Radiative forcing [W/m²]", xlabel="CO₂ concentration [ppm]")
end

# ╔═╡ ac19840d-e7f0-479c-97e6-99177e68e837
begin
	 # CO₂(t) = CO₂_PreIndust # no emissions
	 # CO₂(t) = CO₂_PreIndust * 1.01^t # test model
	  CO₂(t) = CO₂_PreIndust * (1+ (t/220)^3 ) 	# cubic fit
end

# ╔═╡ 24a443bf-73c9-4aec-b40e-c7e0a054b2b6
greenhouse_effect(CO₂(15))

# ╔═╡ 00129a4a-1c92-4b8e-ac99-c1ac626573b8
p3 = ODEProblem( (temp, p, t)-> (1/C) * ( B*(temp₀-temp)  + greenhouse_effect(CO₂(t))    ) , start_temp,  (0.0, 170) )

# ╔═╡ 28cdea50-4fa5-4ea1-8ca3-178dacaa1e73
begin
	plot(solve(p3),       legend = false, 
		 #background_color_inside = :black,
		                  xlabel = "years from 1850",
	                      ylabel = "Temperature °C",
	                      ylim = (10, 20),
						  lw=2)
	hline!( [temp₀,temp₀] ,c=:red,ls=:dash, lw=2)
	annotate!( 80, temp₀, text("Preindustrial Temperature = $(temp₀)°C",:bottom,color=:black))
	title!("Model with CO₂")
end

# ╔═╡ 6399dfdb-0696-4ce3-a6b2-f1386a564d90
begin
	years = 1850:2023
	plot( years, CO₂.(years.-1850), lw=3, legend=false, xlabel = "years",
	                      ylabel = "CO₂  [parts per million; ppm]",)
end;

# ╔═╡ 5a5d0860-07a6-4830-8ac8-f2eea4bbe246
md"""
## Observations from Mauna Loa Volcano 
![Mauna Loa Volcano](https://i.pinimg.com/originals/df/1a/e7/df1ae72cfd5e6d0d535c0ec99e708f6f.jpg)
"""

# ╔═╡ de27709d-0a13-4ac7-9039-ca3bd28bbb40
begin
	CO2_historical_data_url = "https://scrippsco2.ucsd.edu/assets/data/atmospheric/stations/in_situ_co2/monthly/monthly_in_situ_co2_mlo.csv"
	
	CO2_historical_data = CSV.read(download(CO2_historical_data_url), DataFrame, header=58, skipto=61);

	first(CO2_historical_data, 11)
end

# ╔═╡ 27f4e566-3d46-40df-b38e-93e7bb56dc41
md"""
Data is in the fifth column CO₂
"""

# ╔═╡ aa41fbf6-fbdd-49e4-8d98-6e507ca6681c
md"""
Oh no, missing data (-99.99)
"""

# ╔═╡ 8b53cc42-4f47-4542-ad02-339f20426cb9
validrowsmask = CO2_historical_data[:, "     CO2"] .> 0

# ╔═╡ a1795d84-d2da-4429-a24e-1f4311a6545f
begin
	begin
		plot( CO2_historical_data[validrowsmask, "      Date"] , CO2_historical_data[validrowsmask, "     CO2"], label="Mauna Loa CO₂ data (Keeling curve)")
		plot!( years, CO₂.(years.-1850), lw=3 , label="Cubic Fit", legend=:topleft)
		xlabel!("year")
		ylabel!("CO₂ (ppm)")
		title!("CO₂ observations and fit")
	end
end

# ╔═╡ 398994bc-8d05-4a4e-8ebb-7f9eafe32245
md"""
We will use this fit to compare against historical temperatures.
"""

# ╔═╡ 04933517-2d38-4327-9e43-3d5f10f0d247
md"""
Climate feedback B = $(@bind BB Slider(0:.1:4, show_value=true, default=B))

Ocean Heat Capacity C =$(@bind CC Slider(10:.1:200, show_value=true, default=C))
"""

# ╔═╡ d2c21532-0ee6-4285-beeb-d3faa7c4b08c
md"*Click to reveal observations of global warming* $(@bind show_obs CheckBox(default=false))"

# ╔═╡ c957c28e-5751-4379-929d-0db265b1804f
begin
	T_url = "https://data.giss.nasa.gov/gistemp/graphs/graph_data/Global_Mean_Estimates_based_on_Land_and_Ocean_Data/graph.txt";
	#T_url = "https://github.com/Ricardo-Luis/notebooks/blob/main/SAE/graph.txt"
	T_df = CSV.read(download(T_url),DataFrame, header=false, skipto=6,delim="     ");
    # T_df = T_df[:,[1,6]]
end;

# ╔═╡ 982f0a56-7dda-4894-951e-e889264c3faa
p4 = ODEProblem( (temp, p, t)-> (1/CC) * ( BB*(temp₀-temp)  + greenhouse_effect(CO₂(t))    ) , start_temp,  (0.0, 170) );

# ╔═╡ 9bca7a02-a9e3-4c3b-be74-e710c084b65d
solp4 = solve(p4);

# ╔═╡ cbca2434-4db8-4171-84e4-5f32e0384c40
begin
	pT=plot(years,solp4.(years.-1850),lw=2, ylims=(13.6,15.2),
		label="Predicted Temperature from model", legend=:topleft)
	xlabel!("year")
	ylabel!("Temp °C")

	if show_obs;
	plot!( T_df[:,1], parse.(Float64, T_df[:,2]) .+ 14.15, color=:black, label="NASA Observations", legend=:topleft)
	#	plot!( parse.(Float64, T_df[:,1]), parse.(Float64, T_df[:,2]) .+ 14.15, color=:black, label="NASA Observations", legend=:topleft)
	end
	plot(pT)
end

# ╔═╡ 2b34efbe-c604-499f-9daa-2ae454c657ac


# ╔═╡ 9b2df8f8-956c-4563-ba4a-380b9fa8dc1c
md"""
**CO₂ emissions predict the trend, but what about the climate noise?**
	
This natural noise arises due to the **turbulent and chaotic fluid dynamics** of the atmosphere and ocean, as illustrated below.
"""

# ╔═╡ 4c6213fb-1d05-40d6-86ad-c7c2f756604a
html"""

	<div style="padding:0 0 0 0;position:relative;"><iframe width="700" height="394" src="https://www.youtube-nocookie.com/embed/oRsY_UviBPE" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>
"""

# ╔═╡ c9a5871d-de9d-4edb-b9f2-d3c74a62c17c


# ╔═╡ 4533ec3c-d8cd-4dc3-a668-2be70cc3d7f0
md""" 
##  Best- and worst-case projections of future global warming
"""

# ╔═╡ e7707cc1-41b1-431c-93de-1166f4b5494d
md"""
> The presented graphical results of this section are extracted from lesson of researcher Dr. Henri Drake, about "Introduction to Climate Modeling, Nonlinear Dynamics and Stability" in **Introduction to Computational Thinking** course, MIT, fall 2020, [^11].
"""

# ╔═╡ aa1c4b78-250c-44fc-9ba4-1d984b2f1070


# ╔═╡ 131ea3bd-a180-4e58-85f1-b817121d0ffc
md"""
Consider two divergent hypothetical futures:
1. a **low-emissions** world in which emissions decrease such that CO2 concentrations stay below 500 ppm by 2100 (known in climate circles as "RCP2.6") and
2. a **high-emissions** world in which emissions continue increasing and CO2 concentrations soar upwards of 1200 ppm ("RCP8.5").
"""

# ╔═╡ 35cb54ea-5884-4088-bb59-7c222f9faa85
md"""
**RCP** is a suite of scenarios (Representative Concentration Pathways) that describe several potential future pathways. Each scenario defines a pathway in terms of the concentration of carbon in the atmosphere at any date – note that these pathways are defined in terms of the concentration (i.e. the level) of carbon in the atmosphere, not the volume of carbon emissions. 

RCP 8.5 refers to the concentration of carbon that delivers global warming at an average of 8.5 watts per square meter across the planet. The RCP 8.5 pathway delivers a temperature increase of about 4.3˚C by 2100, relative to pre-industrial temperatures. RCP 8.5 is often contrasted with RCP 2.6, which would deliver a total warming of about 1.8˚C by 2100. 

In the characterization of climate change projections, there is debate over whether the climate change scenario RCP 8.5 represents a “business as usual” scenario, a “high emissions” scenario, or a “worst-case” scenario. Further, there are questions about whether RCP 8.5 is consistent with the current trajectory of emissions and whether RCP 8.5 represents the alternate pathway offered by those world leaders championing the use of fossil fuels. 
"""

# ╔═╡ 3b7296ef-5b14-4b0c-baec-c0360914acb7
md"""
![](https://raw.githubusercontent.com/mitmath/18S191/Spring21/notebooks/week12/predictthefuture.svg)
"""

# ╔═╡ f9b11713-14af-44ff-865f-105afb9630f7
md"""
In the low-emissions scenario, the temperature increase stays below $ΔT = 2$ °C by 2100, while in the high-emissions scenario temperatures soar upwards of 3.5ºC above pre-industrial levels.
"""

# ╔═╡ 0a0a1c4e-17a7-4dca-9dce-643d05589e92
md"Although the greenhouse effect due to human-caused CO₂ emissions is the dominant forcing behind historical and future-projected warming, modern climate modelling considers a fairly exhaustive list of other forcing factors (aerosols, other greenhouse gases, ozone, land-use changes, etc.). The video below shows a breakdown of these forcing factors in a state-of-the-art climate model simulation of the historical period."

# ╔═╡ 6716af47-68a3-4ef8-8529-678c0f3ae398
html"""
<iframe width="700" height="394" src="https://www.youtube-nocookie.com/embed/E7kMr2OYKSU" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
"""

# ╔═╡ 7a09d926-44bc-479b-b8ad-fa1023e053c2


# ╔═╡ 18a6c13f-9d10-4469-bdbb-5bd97e2e84b5


# ╔═╡ 0856cc67-62c4-43b5-8077-eb6536670f4c
md"""
# Frequently Asked Questions (FAQs)
"""

# ╔═╡ b8293210-5f47-430e-b0c7-347f21e36b34
md"""
> These FAQs were directly extracted from IPCC 2022 report, Climate Change 2022: Mitigation of Climate Change.[^6]

"""

# ╔═╡ da0d4a35-a3f5-42b1-8364-46abc6e9674c
Foldable("FAQ 1: Introduction and Framing",md"
**FAQ 1.1 |  What is climate change mitigation?**

Climate change mitigation refers to actions or activities that limit emissions of greenhouse gases (GHGs) from entering the atmosphere and/or reduce their levels in the atmosphere. Mitigation includes reducing the GHGs emitted from energy production 
and use (e.g., that reduces use of fossil fuels), and land use, and methods to mitigate warming, for example, by carbon sinks which remove emissions from the atmosphere through land-use or other (including artificial) mechanisms (Sections 12.3 and 14.4.5; see AR6 WGI for physical science, and WGIII Chapter 7 for AFOLU mitigation).
The ultimate goal of mitigation is to preserve a biosphere which can sustain human civilisation and the complex of ecosystem services which surround and support it. This means reducing anthropogenic GHG emissions towards net zero to limit the warming, with global goals agreed in the Paris Agreement. Effective mitigation strategies require an understanding of mechanisms that underpin release of emissions, and the technical, policy and societal options for influencing these.


**FAQ 1.2 |  Which greenhouse gases (GHGs) are relevant to which sectors?**

Anthropogenic GHGs such as carbon dioxide (CO2), methane (CH4), nitrous oxide (N2O), and fluorinated gases (e.g., hydrofluorocarbons, perfluorocarbons, sulphur hexafluoride) are released from various sources. CO2 makes the largest contribution to global GHG emissions, but some have extremely long atmospheric lifetimes extending to tens of thousands of years, such as F-gases (Chapter 2).
Different combinations of gases are emitted from different activities. The largest source of CO2 is combustion of fossil fuels in energy conversion systems like boilers in electric power plants, engines in aircraft and automobiles, and in cooking and heating within homes and businesses (approximately 64% of emissions, Figure SPM.2). Fossil fuels are also a major source of methane (CH4), the second biggest contributor to global warming. While most GHGs come from fossil fuel combustion, about one quarter comes from land-related activities like agriculture (mainly CH4 and N2O) and deforestation (mainly CO2), with additional emissions from industrial processes (mainly CO2, N2O and F-gases), and municipal waste and wastewater (mainly CH4) (Chapter 2). In addition to these emissions, black carbon – an aerosol that is, for example, emitted during incomplete combustion of fossil fuels – contributes 
to warming of the Earth’s atmosphere, whilst some other short-lived pollutants temporarily cool the surface (IPCC AR6 WGI Section 6.5.4.3).


**FAQ 1.3 |  What is the difference between ‘net zero emissions’ and ‘carbon neutrality’?**

Annex I (Glossary) states that ‘carbon neutrality and net zero CO2 emissions are overlapping concepts’ which ‘can be applied at the global or sub-global scales (e.g., regional, national and sub-national)’. At the global scale the terms are equivalent. At sub-global scales, net zero CO2 typically applies to emissions under direct control or territorial responsibility of the entity reporting them (e.g., a country, district or sector); while carbon neutrality is also applied to firms, commodities and activities (e.g., a service or an event) and generally includes emissions and removals beyond the entity’s direct control or territorial responsibility, termed ‘Scope 3’ or ‘value chain emissions’ (Bhatia et al. 2011).
This means the emissions and removals that should be included are wider for ‘neutrality’ than for net zero goals, but also that offset mechanisms could be employed to help achieve neutrality through abatement beyond what is possible under the direct control of the entity. Rules and environmental integrity criteria are intended to ensure additionality and avoid double counting of offsets consistent with ‘neutrality’ claims (see ‘carbon neutrality’ and ‘offset’ in Glossary, for detail and a list of criteria). While the term ‘carbon’ neutrality in this report is defined as referring specifically to CO2 neutrality, use of this term in practice can be ambiguous, as some users apply it to neutrality of all GHG emissions. GHG neutrality means an entity’s gross emissions of all GHG must be balanced by the removal of an equivalent amount of CO2 from the atmosphere. This requires the selection of a suitable metric that aggregates emissions from non-CO2 gases, such as the commonly used GWP100 metric (for a discussion of GHG metrics, see AR6 WGI Box 1.3 and Cross-Chapter Box 2 in Chapter 2 of this report).
")

# ╔═╡ d8c9b4d7-341b-4ed1-b493-7ffce0804484
Foldable("FAQ 2: Emissions Trends and Drivers",md"
**FAQ 2.1 |  Are emissions still increasing or are they falling?**

Global greenhouse gas (GHG) emissions continued to rise and reached 59 ± 6.6 GtCO2-eq in 2019, although the rate of growth has fallen compared to the previous decade. However, emissions were higher than at any point in human history before. Emissions were around 12% and 54% higher than in 2010 and 1990, respectively. Average annual GHG emissions for 2009–2019 were higher compared to the periods 2000–2009 and 1990–1999, respectively. GHG emissions growth slowed since 2010: while average annual GHG emissions growth was 2.1% for 2000–2010, it was only 1.3% for 2010–2019. In order to stop the temperature increase, however, net emissions must be zero.


**FAQ 2.2 |  Are there countries that have reduced emissions and grown economically 
at the same time?**

About 24 countries have reduced territorial CO2 and GHG emissions for more than 10 years. Uncertainties in emission levels and changes over time prevent a precise assessment in some country cases. In the short observation period of 2010–2015, 43 out of 166 countries have achieved absolute decoupling of consumption-based CO2 emissions from economic growth, which means that these countries experienced GDP growth while their emissions have stabilised or declined. A group of developed countries, such as some EU countries and the USA, and some developing countries, such as Cuba, have successfully achieved an absolute decoupling of consumption-based CO2 emissions and GDP growth. Decoupling has been achieved at various levels of per capita income and per capita emissions. Overall, the absolute reduction in annual emissions achieved by some countries has been outweighed by growth in emissions elsewhere in the world.


**FAQ 2.3 |  How much time do we have to act to keep global warming below 1.5 degrees?**

If global CO2 emissions continue at current rates, the remaining carbon budget for keeping warming to 1.5°C will likely be exhausted before 2030. Between 1850 and 2019, total cumulative CO2 emissions from the fossil fuel industry (FFI) and agriculture, 
forestry, and other land use (AFOLU) were 2400 (±240 GtCO2). Of these, about 410 ± 30 GtCO2 were added since 2010. This is about the same size as the remaining carbon budget for keeping global warming to 1.5°C and between one-third and one-half 
of the 1150 ± 220 (1350, 1700) GtCO2 for limiting global warming below 2°C with a 67% (50%, 33%) probability, respectively (Canadell et al. 2021). At current (2019) rates of emissions, it would only take 8 (2–15) and 25 (18–35) years to emit the equivalent 
amount of CO2 for a 67th percentile 1.5°C and 2°C remaining carbon budget, respectively. This highlights the dependence of 1.5°C pathways on the availability of substantial CO2 removal capacities, as discussed in Chapters 3, 4, and 12, but also Section 2.7 of this chapter.
")


# ╔═╡ 06f840e7-45ee-49e5-8fc5-25411d73d0cc
Foldable("FAQ 3: Mitigation Pathways Compatible with Long-term Goals",md"

**FAQ 3.1 | Is it possible to stabilise warming without net negative CO2 and GHG emissions?**

Yes. Achieving net zero CO2 emissions and sustaining them into the future is sufficient to stabilise the CO2-induced warming signal which scales with the cumulative net amount of CO2 emissions. At the same time, the warming signal of non-CO2 GHGs can be stabilised or reduced by declining emissions that lead to stable or slightly declining concentrations in the atmosphere. For short-lived GHGs with atmospheric lifetimes of less than 20 years, this is achieved when residual emissions are reduced to levels that are lower than the natural removal of these gases in the atmosphere. Taken together, mitigation pathways that bring CO2 emissions to net zero and sustain it, while strongly reducing non-CO2 GHGs to levels that stabilise or decline their aggregate warming contribution, will stabilise warming without using net negative CO2 emissions and with positive overall GHG emissions when aggregated using GWP-100. A considerable fraction of pathways that limit warming to 1.5°C (>50%) with no or limited overshoot and limit warming to 2°C (>67%), respectively, do not or only marginally (<10 GtCO2 cumulative until 2100) deploy net negative CO2 emissions (26% and 46%, respectively) and do not reach net zero GHG emissions by the end of the century (48% and 70%, respectively). This is no longer the case in pathways that return warming to 1.5°C (>50%) after a high overshoot (typically >0.1°C). All of these pathways deploy net negative emissions on the order of 360 (60–680) GtCO2 (median and 5–95th percentile) and 87% achieve net negative GHGs emissions in AR6 GWP-100 before the end of the century. Hence, global net negative CO2 emissions, and net zero or net negative GHG emissions, are only needed to decline, not to stabilise global warming. The deployment of carbon dioxide removal (CDR) is distinct from the deployment of net negative CO2 emissions, because it is also used to neutralise residual CO2 emissions to achieve and sustain net zero CO2 emissions. CDR deployment can be considerable in pathways without net negative emissions and all pathways limiting warming to 1.5°C use it to some extent.


**FAQ 3.2 | How can net zero emissions be achieved and what are the implications of net zero emissions for the climate?**

Halting global warming in the long term requires, at a minimum, that no additional CO2 emissions from human activities are added 
to the atmosphere (i.e., CO2 emissions must reach ‘net’ zero). Given that CO2 emissions constitute the dominant human influence 
on global climate, global net zero CO2 emissions are a prerequisite for stabilising warming at any level. However, CO2 is not the 
only greenhouse gas that contributes to global warming and reducing emissions of other greenhouse gases (GHGs) alongside 
CO2 towards net zero emissions of all GHGs would lower the level at which global temperature would peak. The temperature 
implications of net zero GHG emissions depend on the bundle of gases that is being considered, and the emissions metric used to 
calculate aggregated GHG emissions and removals. If reached and sustained, global net zero GHG emissions using the 100-year 
Global Warming Potential (GWP-100) will lead to gradually declining global temperature.
Not all emissions can be avoided. Achieving net zero CO2 emissions globally therefore requires deep emissions cuts across all sectors and regions, along with active removal of CO2 from the atmosphere to balance remaining emissions that may be too difficult, too costly, or impossible to abate at that time. Achieving global net zero GHG emissions would require, in addition, deep reductions of non-CO2 emissions and additional CO2 removals to balance remaining non-CO2 emissions.
Not all regions and sectors must reach net zero CO2 or GHG emissions individually to achieve global net zero CO2 or GHG emissions, respectively; instead, positive emissions in one sector or region can be compensated by net negative emissions from another sector or region. The time each sector or region reaches net zero CO2 or GHG emissions depends on the mitigation options available, the cost of those options, and the policies implemented (including any consideration of equity or fairness). Most modelled pathways that likely limit warming to 2°C (>67%) above pre-industrial levels and below use land-based CO2 removal such as afforestation/reforestation and BECCS to achieve net zero CO2 and net zero GHG emissions even while some CO2 and non-CO2 emissions continue to occur. Pathways with more demand-side interventions that limit the amount of energy we use, or where the diet that we consume is changed, can achieve net zero CO2, or net zero GHG emissions with less carbon dioxide removal (CDR). All available studies require at least some kind of carbon dioxide removal to reach net zero; that is, there are no studies where absolute zero GHG or even CO2 emissions are reached by deep emissions reductions alone.
Total GHG emissions are greater than emissions of CO2 only; reaching net zero CO2 emissions therefore occurs earlier, by up to several decades, than net zero GHG emissions in all modelled pathways. In most modelled pathways that likely limit warming to 2°C (>67%) above pre-industrial levels and below in the most cost-effective way, the agriculture, forestry and other land-use (AFOLU) and energy supply sectors reach net zero CO2 emissions several decades earlier than other sectors; however, many pathways show much reduced, but still positive, net GHG emissions in the AFOLU sector in 2100.


**FAQ 3.3 | How plausible are high emissions scenarios, and how do they inform policy?**

IAMs are used to develop a wide range of scenarios describing future trajectories for greenhouse gas emissions based on a wide set of assumptions regarding socio-economic development, technological changes, political development and climate policy. Typically, the IAM-based scenarios can be divided into (i) reference scenarios (describing possible trajectories in the absence of new stringent climate policies) and (ii) mitigation scenarios (describing the impact of various climate policy assumptions). Reference scenarios typically result in high emissions and, subsequently, high levels of climate change (in the order of 2.5°C–4°C during the 21st century). 
The purpose of such reference scenarios is to explore the consequences of climate change and act as a reference for mitigation scenarios. The possible emission levels for reference scenarios diverge from stabilising and even slowly declining emissions (e.g., for current policy scenarios or SSP1) to very high emission levels (e.g., SSP5 and RCP8.5). The latter leads to nearly 5°C of warming by the end of the century for medium climate sensitivity. Hausfather and Peters (2020) pointed out that since 2011, the rapid development of renewable energy technologies and emerging climate policy have made it considerably less likely that emissions could end up as high as RCP8.5. This means that reaching emissions levels as high as RCP8.5 has become less likely. Still, high emissions cannot be ruled out for many reasons, including political factors and, for instance, higher than anticipated population and economic growth. Climate projections of RCP8.5 can also result from strong feedbacks of climate change on (natural) emission sources and high climate sensitivity (AR6 WGI Chapter 7). Therefore, their median climate impacts might also materialise while following a lower emission path (e.g., Hausfather and Betts 2020). All in all, this means that high-end scenarios have become considerably less likely since AR5 but cannot be ruled out. High-end scenarios (like RCP8.5) can be very useful to explore high-end risks of climate change but are not typical ‘business-as-usual’ projections and should therefore not be presented as such.
")

# ╔═╡ b75e8550-fec6-4b1b-ab2a-ebfd7ce7d42c
Foldable("FAQ 4: Mitigation and Development Pathways in the Near to Mid-term",md"

**FAQ 4.1 | What is to be done over and above countries’ existing pledges under the Paris Agreement to keep global warming well below 2°C?**

Current pledges and efforts under the PA aimed at keeping global warming below 2°C are not enough, falling short by 14 to 23 GtCO2-eq (Cross-Chapter Box 4 in this Chapter). There is a further shortfall of about 4 to 7 GtCO2-eq in 2030 if the conditions are not fulfilled for those Parties that have made their pledges with conditions for support (Section 4.2.2.3). To cover up for these shortfalls will require taking actions across all sectors that can substantially reduce GHG emissions. Examples of such actions include shifting to low- or zero-emission power generation, such as renewables; changing food systems, such as diet changes away from land-intensive animal products; electrifying transport and developing ‘green infrastructure’, such as building green roofs, or improving energy efficiency by smart urban planning, which will change the layout of many cities. Because these different actions are connected, it means all relevant companies, industries and stakeholders would need to be involved to increase the support and chance of successful implementation (Section 4.2.5). The deployment of low-emission technology depends upon economic conditions (e.g., employment generation or capacity to mobilise investment), but also on social/cultural conditions (e.g., awareness and acceptability) and institutional conditions (e.g., political support and understanding), and the provision of relevant enabling conditions (Section  4.4.1). Encouraging stronger and more ambitious climate action by non-government and sub-national stakeholders, as well as international cooperative initiatives (ICIs) could make significant contributions to emissions reduction (Section 4.2.3).


**FAQ 4.2 | What is to be done in the near term to accelerate mitigation and shift 
development pathways?**

Increasing speed of implementation, breadth of action across all sectors of the economy, and depth of emission reduction faces important obstacles, that are rooted in the underlying structure of societies (Section 4.2.7). Addressing these obstacles amounts to shifting away from existing developmental trends (i.e., shifting development pathways, Cross-Chapter Box 5). This can be done by strengthening governance and institutional capacity, aligning technology and innovation systems with low-carbon development, facilitating behaviour change and providing adequate finance within the context of multi-objective policy packages and sequences (Section  4.4.1). Shifting development pathways towards sustainability broadens the scope for, and is thus a  complement to, accelerated mitigation (Section 4.3).


**FAQ 4.3 | Is it possible to accelerate mitigation in the near term while there are so many other development priorities? (Education, health, employment, etc.)**

It is possible to accelerate mitigation while addressing other developmental priorities by implementing measures that simultaneously address both climate and development goals. Casting mitigation in the broader context of development pathways provides additional opportunities to articulate both (Section 4.3.1.4). Policies such as progressive taxation, investment in public transport, regulatory transparency, commitment to multilateral environmental governance, fiscal incentives for private investments, international technology development and transfer initiatives, and risk disclosure and efforts to improve underlying enabling conditions (improving governance and institutional capacity, fostering behavioural change and technological innovation, and provision of finance) address multiple objectives beyond mitigation, such as job creation, macroeconomic stability, economic growth, public health and welfare, providing energy access, providing formal housing, and providing mobility. How we manage our land and agriculture, growing cities, transport needs, our industries, and the way people are trained and employed all impact on GHG emissions and the options we have to reduce them. In turn, reducing GHG emissions can also contribute to reducing poverty, preventing hunger, improving health and wellbeing, and providing clean water and clean energy. Implementing right policies and investments can help to address the challenges of how to reduce emissions without constraining development. For example, in land use, widespread planting of a single tree species or crops for bioenergy (organic matter turned into renewable energy) could affect food and water supplies. Therefore, if bioenergy is to be relied upon to offset emissions, the right policies and investments are needed (see also Chapter 17).


")

# ╔═╡ 5224cd0e-3fbc-4584-b793-5e4cc3549595
Foldable("FAQ 5: Demand, Services and Social Aspects of Mitigation",md"

**FAQ 5.1 | What can every person do to limit warming to 1.5°C?**

People can be educated through knowledge transfer so they can act in different roles, and in each role everyone can contribute to limit global warming to 1.5°C. Citizens with enough knowledge can organise and put political pressure on the system. Role models can set examples to others. Professionals (e.g., engineers, urban planners, teachers, researchers) can change professional standards in consistency with decarbonisation; for example urban planners and architects can design physical infrastructures to facilitate lowcarbon mobility and energy use by making walking and cycling safe for children. Rich investors can make strategic plans to divest from fossils and invest in carbon-neutral technologies. Consumers, especially those in the top 10% of the world population in terms of income, can limit consumption, especially in mobility, and explore the good life consistent with sustainable consumption.
Policymakers support individual actions in certain contexts, not only by economic incentives, such as carbon pricing, but also by interventions that understand complex decision-making processes, habits, and routines. Examples of such interventions include, but are not limited to, choice architectures and nudges that set green options as default, shift away from cheap petrol or gasoline, increasing taxes on carbon-intensive products, or substantially tightening regulations and standards to support shifts in social norms, and thus can be effective beyond the direct economic incentive.


**FAQ 5.2 | How does society perceive transformative change?**

Humaninduced global warming, together with other global trends and events, such as digitalisation and automation, and the COVID-19 pandemic, induce changes in labour markets, and bring large uncertainty and ambiguity. History and psychology reveal that societies can thrive in these circumstances if they openly embrace uncertainty on the future and try out ways to improve life. 
Tolerating ambiguity can be learned, for example by interacting with history, poetry and the arts. Sometimes religion and philosophy also help.
As a key enabler, novel narratives created in a variety of ways, such as by advertising, images and the entertainment industry, help to break away from the established meanings, values and discourses and the status quo. For example, discourses that frame comfortable public transport services to avoid stress from driving cars on busy, congested roads help avoid car driving as a status symbol and create a  new social norm to shift to public transport. Discourses that portray plant-based protein as healthy and natural promote and stabilise particular diets. Novel narratives and inclusive processes help strategies to overcome multiple barriers. 
Case studies demonstrate that citizens support transformative changes if participatory processes enable a design that meets local interests and culture. Promising narratives specify that even as speed and capabilities differ, humanity embarks on a joint journey towards well-being for all and a healthy planet.


**FAQ 5.3 | Is demand reduction compatible with growth of human well-being?**

There is a growing realisation that mere monetary value of income growth is insufficient to measure national welfare and individual well-being. Hence, any action towards climate change mitigation is best evaluated against a set of indicators that represent a broader variety of needs to define individual well-being, macroeconomic stability, and planetary health. Many solutions that reduce primary material and fossil energy demand, and thus reduce GHG emissions, provide better services to help achieve well-being for all.
Economic growth measured by total or individual income growth is a main driver of GHG emissions. Only a few countries with low economic growth rates have reduced both territorial and consumption-based GHG emissions, typically by switching from fossil fuels to renewable energy and by reduction in energy use and switching to low/zero carbon fuels, but until now at insufficient rates and levels for stabilising global warming at 1.5°C. High deployment of low/zero carbon fuels and associated rapid reduction in demand for and use of coal, gas, and oil can further reduce the interdependence between economic growth and GHG emissions.

")

# ╔═╡ 20bee7fd-0404-4f57-8e2b-df1ebb997c73
Foldable("FAQ 6: Energy Systems",md"

**FAQ 6.1 | Will energy systems that emit little or no CO2 be different than those of today?**

Low-carbon energy systems will be similar to those of today in that they will provide many of the same services as today – for example, heating and cooling homes, travelling to work or on vacation, transporting goods and services, and powering manufacturing. But future energy systems may be different in that people may also demand new services that aren’t foreseen today, just as people now use energy for many information technology uses that were not anticipated 50 years ago. More importantly, low-carbon energy systems will be different in the way that energy is produced, transformed, and used to provide these services. In the future, almost all electricity will be produced from sources that emit little or no CO2, such as solar power, wind power, nuclear power, bioenergy, hydropower, geothermal power, or fossil energy in which the CO2 is captured and stored. Electricity, hydrogen, and bioenergy will be used in many situations where fossil fuels are used today, for example, in cars or heating homes. And energy is likely to be used more efficiently than today, for example, through more efficient cars, trucks, and appliances, buildings that use very little energy, and greater use or public transportation. All of these changes may require new policies, institutions, and even new ways for people to live their lives. And fundamental to all of these changes is that low-carbon energy systems will use far less fossil fuel than today.


**FAQ 6.2 | Can renewable sources provide all the energy needed for energy systems that emit little or no CO2?**

Renewable energy technologies harness energy from natural sources that are continually replenished, for example, from the sun (solar energy), the wind (wind energy), plants (bioenergy), rainfall (hydropower), or even the ocean. The energy from these sources exceeds the world’s current and future energy needs many times. But that does not mean that renewable sources will provide all energy in future low-carbon energy systems. Some countries have a lot of renewable energy, whereas others do not, and other energy sources, such as nuclear power or fossil energy in which CO2 emissions are captured and stored (carbon dioxide capture and storage, or CCS) can also contribute to low-carbon energy systems. The energy from sources such as solar energy, wind energy, and hydropower can vary throughout the day or over seasons or years. All low-carbon energy sources have other implications for people and countries, some of which are desirable, for example, reducing air pollution or making it easy to provide electricity in remote locations, and some of which are undesirable, for example decreasing biodiversity or mining of minerals to produce lowemissions technologies. For all of these reasons, it is unlikely that all low-carbon energy systems around the world will rely entirely on renewable energy sources.


**FAQ 6.3 | What are the most important steps to decarbonise the energy system?**

To create a low-carbon energy system, emissions must be reduced across all parts of the system, and not just one or two. This means, for example, reducing the emissions from producing electricity, driving cars, hauling freight, heating and cooling buildings, powering data centres, and manufacturing goods. There are more opportunities to reduce emissions over the next decade in some sectors compared to others. For example, it is possible to substantially reduce electricity emissions over the next decade by investing in low-carbon electricity sources, while at the same time halting the construction of new coal-fired power plants, retiring existing coal-fired power plants or retrofitting them with carbon capture and storage (CCS), and limiting the construction of new gas-fired power plants. There are also opportunities to increase the number of electric cars, trucks, and other vehicles on the road, or to use electricity rather than natural gas or coal to heat homes. And across the whole energy system, emissions can be reduced by using more efficient technologies. While these and other actions will be critical over the coming decade, it is also important to remember that the low-carbon energy transition needs to extend for many decades into the future to limit warming. This means that it is important now to improve and test options that could be useful later on, for example, producing hydrogen from low-carbon sources or producing bioenergy from crops that require less land than today.

")

# ╔═╡ 65b0a3e8-b5c3-41f0-ba0c-c7501e8d46a0
Foldable("FAQ 7: Agriculture, Forestry and Other Land Uses (AFOLU)",md"

**FAQ 7.1 | Why is the Agriculture, Forestry and Other Land Uses (AFOLU) sector unique when considering GHG mitigation?**

There are three principal reasons that make the AFOLU sector unique in terms of mitigation:
In contrast to other sectors, AFOLU can facilitate mitigation in several different ways. Specifically, AFOLU can (i) reduce emissions as a sector in its own right, (ii) remove meaningful quantities of carbon from the atmosphere and relatively cheaply, and (iii) provide raw materials to enable mitigation within other sectors, such as energy, industry or the built environment.
The emissions profile of AFOLU differs from other sectors, with a greater proportion of non-CO2 gases (N2O and CH4). The impacts of mitigation efforts within AFOLU can vary according to which gases are targeted, as a result of the differing atmospheric lifetime of the gases and differing global temperature responses to the accumulation of the specific gases in the atmosphere.
In addition to tackling climate change, AFOLU mitigation measures have capacity, where appropriately implemented, to help address some critical, wider challenges, as well as contributing to climate change adaptation. AFOLU is inextricably linked with some of the most serious challenges that are suggested to have ever faced humanity, such as large-scale biodiversity loss, environmental degradation and the associated consequences. As AFOLU concerns land management and utilises a considerable portion of the Earth’s terrestrial area, the sector greatly influences soil, water and air quality, biological and social diversity, the provision of natural habitats, and ecosystem functioning, consequently impacting many SDGs.

**FAQ 7.2 | What AFOLU measures have the greatest economic mitigation potential?**

Economic mitigation potential refers to the mitigation estimated to be possible at an annual cost of up to USD100 tCO2–1 mitigated. 
This cost is deemed the price at which society is willing to pay for mitigation and is used as a proxy to estimate the proportion of technical mitigation potential that could realistically be implemented. Between 2020 and 2050, measures concerning forests and other ecosystem are estimated to have an average annual mitigation potential of 7.3 (3.9–13.1) GtCO2-eq yr–1 at USD100 tCO2–1. 
At the same cost, agricultural measures are estimated to have a potential of 4.1 (1.7–6.7) GtCO2-eq yr–1. Emerging technologies, such as CH4 vaccines and inhibitors, could sustainably increase agricultural mitigation potential in future. The diverted production effects of changes in demand (reduced food losses, diet changes and improved and enhanced wood products use), is estimated to have an economic potential of 2.2 (1.1–3.6) GtCO2-eq yr–1. However, cost forms only one constraint to mitigation, with realisation of economic potential dependent on multiple context-specific environmental and socio-cultural factors.


**FAQ 7.3 | What are potential impacts of large-scale establishment of dedicated bioenergy plantations and crops and why is it so controversial?**

The potential of bioenergy with carbon capture and storage (BECCS) remains a focus of debate with several studies evaluating the level at which BECCS could be sustainably implemented, published since AR5. BECCS involves sequestering carbon through plant growth (i.e., in trees or crops) and capturing the carbon generated when this biomass is processed for power or fuel. The captured carbon then requires long-term storage in for example, geological, terrestrial or ocean reservoirs, or in products. While appearing to create a net removal of carbon from the atmosphere, BECCS requires land, water and energy which can create adverse side effects at scale. Controversy has arisen because some of the models calculating the energy mix required to keep the temperature to 1.5°C have included BECCS at very large scales as a means of both providing energy and removing carbon from the atmosphere to offset emissions from industry, power, transport or heat. For example, studies have calculated that for BECCS to achieve 11.5 GtCO2-eq per year of carbon removal in 2100, as envisaged in one scenario, 380–700 Mha or 25–46% of all the world’s arable and cropland would be needed. In such a  situation, competition for agricultural land seriously threatens food production and food security, while also impacting biodiversity, water and soil quality, and landscape aesthetic value. More recently however, the scenarios for BECCS have become much more realistic, though concerns regarding impacts on food security and the environment remain, while the reliability of models is uncertain due to methodological flaws. Improvements to models are required to better capture wider environmental and social impacts of BECCS in order to ascertain its sustainable contribution in emissions pathways. Additionally, the opportunity for other options that could negate very large-scale deployment of BECCS, such as other carbon dioxide removal measures or more stringent emission reductions in other sectors, could be explored within models.

")

# ╔═╡ 88703d39-3e5e-45e4-8470-d6bf2255abfc
Foldable("FAQ 8: Urban Systems and Other Settlements",md"

**FAQ 8.1 |  Why are urban areas important to global climate change mitigation?**

Over half of the world’s population currently resides in urban areas – a number forecasted to increase to nearly 70% by 2050. 
Urban areas also account for a growing proportion of national and global emissions, depending on emissions scope and geographic boundary. These trends are projected to grow in the coming decades; in 2100, some scenarios show the urban share of global emissions above 80%, with 63% being the minimum for any scenario (with the shares being in different contexts of emissions reduction or increase) (Sections 8.3.3 and 8.3.4). As such, urban climate change mitigation considers the majority of the world’s population, as well as some of the key drivers of global emissions. In general, emissions scenarios with limited outward urban land expansion are also associated with a smaller rise in global temperature (Section 8.3.4).
The urban share of global emissions and its projected growth stem in part from urban carbon lock-in – that is, the path dependency and inertia of committed emissions through the long lifespan of urban layout, infrastructures, and behaviour. As such, urban mitigation efforts that address lock-in can significantly reduce emissions (Section 8.4.1). Electrification of urban energy systems, in tandem with implementing multiple urban-scale mitigation strategies, could reduce urban emissions by 90% by 2050 – thereby significantly reducing global emissions (Section 8.3.4). Urban areas can also act as points of intervention to amplify synergies and co-benefits for accomplishing the Sustainable Development Goals (Section 8.2).


**FAQ 8.2 | What are the most impactful options cities can take to mitigate urban emissions, and how can these be best implemented?**

The most impactful urban mitigation plans reduce urban GHG emissions by considering the long lifespan of urban layout and urban infrastructures (Sections  8.4.1 and 8.6). Chapter  8  identifies three overarching mitigation strategies with the largest potential to decrease current, and avoid future, urban emissions: (i) reducing or changing urban energy and material use towards more sustainable production and consumption across all sectors including through spatial planning and infrastructure that supports compact, walkable urban form (Section  8.4.2); (ii) decarbonise through electrification of the urban energy system, and switch to net-zero-emissions resources (i.e., low-carbon infrastructure) (Section 8.4.3); and (iii) enhance carbon sequestration through urban green and blue infrastructure (e.g., green roofs, urban forests and street trees), which can also offer multiple co-benefits like reducing ground temperatures and supporting public health and well-being (Section 8.4.4). Integrating these mitigation strategies across sectors, geographic scales, and levels of governance will yield the greatest emissions savings (Sections 8.4 and 8.5). A city’s layout, patterns, and spatial arrangements of land use, transportation systems, and built environment (urban form), as well as its state and form(s) of development (urban growth typology), can inform the most impactful emissions savings ‘entry points’ and priorities for urban mitigation strategies (Sections 8.4.2 and 8.6). For rapidly growing and emerging urban areas, there is the opportunity to avoid carbon lock-in by focusing on urban form that promotes low-carbon infrastructure and enables low-impact behaviour facilitated by co-located medium to high densities of jobs and housing, walkability, and transit-oriented development (Sections 8.6.2 and 8.6.3). For established cities, strategies include electrification of the grid and transport, and implementing energy efficiency across sectors (Section 8.6.1).


**FAQ 8.3 |   How do we estimate global emissions from cities, and how reliable are the estimates?**

There are two different emissions estimation techniques applied, individually or in combination, to the four frameworks outlined in Section 8.1.6.2 to estimate urban GHG emissions: ‘top-down’ and ‘bottom-up’. The top-down technique uses atmospheric GHG concentrations and atmospheric modelling to estimate direct (scope 1) emissions (see Glossary). The bottom-up technique estimates emissions using local activity data or direct measurements such as in smokestacks, traffic data, energy consumption information, and building use. Bottom-up techniques will often include indirect emissions (see Glossary) from purchased electricity (scope 2) and the urban supply chain (scope 3). Inclusion of supply-chain emissions often requires additional data such as consumer purchasing data and supply chain emission factors. Some researchers also take a hybrid approach combining top-down and bottom-up estimation techniques to quantify territorial emissions. Individual self-reported urban inventories from cities have shown chronic underestimation when compared to estimates using combined top-down/bottom-up atmospherically calibrated estimation techniques.
No approach has been systematically applied to all cities worldwide. Rather, they have been applied individually or in combination to subsets of global cities. Considerable uncertainty remains in estimating urban emissions. However, top-down approaches have somewhat more objective techniques for uncertainty estimation in comparison to bottom-up approaches. Furthermore, supply chain estimation typically has more uncertainty than direct or territorial emission frameworks.
")

# ╔═╡ 3d847e58-878a-47ef-b8e2-947905e07940
Foldable("FAQ 9: Buildings",md"

**FAQ 9.1 | To which GHG emissions do buildings contribute?**

There are three categories of GHG emissions from buildings: 
i. direct emissions which are defined as all on-site fossil fuel or biomass-based combustion activities (i.e.,  use of biomass for cooking, or gas for heating and hot water) and F-gas emissions (i.e., use of heating and cooling systems, aerosols, fire extinguishers, soundproof); 
ii. indirect emissions which occur off-site and are related to heat and electricity production; and 
iii. embodied emissions which are related to extracting, producing, transforming, transporting, and installing the construction material and goods used in buildings.
In 2019, global GHG emissions from buildings were at 12 GtCO2-eq out of which 24% were direct emissions, 57% were indirect emissions, and 18% were embodied emissions. More than 95% of emissions from buildings were CO2 emissions, CH4 and N2O represented 0.08% each and emissions from halocarbon contributed by 3% to global GHG emissions from buildings.

**FAQ 9.2 | What are the co-benefits and trade-offs of mitigation actions in buildings?**

Mitigation actions in buildings generate multiple co-benefits (e.g.,  health benefits due to the improved indoor and outdoor conditions, productivity gains in non-residential buildings, creation of new jobs particularly at local level, improvements in social well-being etc.) beyond their direct impact on reducing energy consumption and GHG emissions. Most studies agree that the value of these multiple benefits is greater than the value of energy savings and their inclusion in economic evaluation of mitigation actions may improve substantially their cost-effectiveness. It is also worth mentioning that in several cases the buildings sector is characterised by strong rebound effects, which could be considered as a co-benefit in cases where the mechanisms involved provide faster access to affordable energy but also a trade-off in cases where the external costs of increased energy consumption exceed the welfare benefits of the increased energy service consumption, thus lowering the economic performance of mitigation actions. The magnitude of these co-benefits and trade-offs are characterised by several uncertainties, which may be even higher in the future as mitigation actions will be implemented in a changing climate, with changing building operation style and occupant behaviour. Mitigation measures influence the degree of vulnerability of buildings to future climate change. For instance, temperature rise can increase energy consumption, which may lead to higher GHG emissions. Also, sea level rise, increased storms and rainfall under future climate may impact building structure, materials and components, resulting in increased energy consumption and household expenditure from producing and installing new components and making renovations. Well-planned energy efficiency, sufficiency and on-site renewable energy production can help to increase building resilience to climate change impacts and reduce adaptation needs.


**FAQ 9.3 | Which are the most effective policies and measures to decarbonise the building sector?**

Several barriers (information, financing, markets, behavioural, etc.) still prevents the decarbonisation of buildings stock, despite the several co-benefits, including large energy savings. Solutions include investments in technological solutions (e.g., insulation, efficient equipment, and low-carbon energies and renewable energies) and lifestyle changes. In addition, the concept of sufficiency is suggested to be promoted and implemented through policies and information, as technological solutions will be not enough to decarbonise the building sector. Due to the different types of buildings, occupants, and development stage there is not a single policy, which alone will reach the building decarbonisation target. A range of policy instruments ranging from regulatory measures such as building energy code for NZEBs and appliance standards, to market-based instruments (carbon tax, personal carbon allowance, renewable portfolio standards, etc.) and information. Financing (grants, loans, performance base incentives, pays as you save, etc.) is another key enabler for energy efficiency technologies and on-site renewables. Finally, effective governance and strong institutional capacity are key to have an effective and successful implementation of policies and financing.
")

# ╔═╡ 1a17e04e-ed1e-4524-87c3-1b6fddf48706
Foldable("FAQ 10: Transport",md"

**FAQ 10.1 |  How important is electromobility in decarbonising transport and are there major constraints in battery minerals?**

Electromobility is the biggest change in transport since AR5. When powered with low-carbon electricity, electric vehicles (EVs) provide a  mechanism for major GHG emissions reductions from the largest sources in the transport sectors, including cars, motorbikes, autorickshaws, buses and trucks. The mitigation potential of EVs depends on the decarbonisation of the power system. 
EVs can be charged by home or business renewable power before or in parallel to the transition to grid-based low-carbon power.
Electromobility is happening rapidly in micromobility (e-autorickshaws, e-scooters, e-bikes) and in transit systems, especially buses. 
EV adoption is also accelerating for personal cars. EVs can be used in grid stabilisation through smart charging applications.
The state-of-the-art lithium-lon batteries (LIBs) available in 2020 are superior to alternative cell technologies in terms of battery life, energy density, specific energy, and cost. The expected further improvements in LIBs suggest these chemistries will remain superior to alternative battery technologies in the medium term, and therefore LIBs will continue to dominate the electric vehicle market.
Dependence on LIB metals will remain, which may be a concern from the perspective of resource availability and costs. However, the demand for such metals is much lower than the reserves available, with many new mines starting up in response to the new market, particularly in a diversity of places.
Recycling batteries will significantly reduce long-term resource requirements. The standardisation of battery modules and packaging within and across vehicle platforms, as well as increased focus on design for recyclability, are important. Many mobility manufacturers and governments are considering battery recycling issues to ensure the process is mainstreamed.
The most significant enabling condition in electromobility is to provide electric recharging opportunities and an integration strategy so that vehicles support the grid.


**FAQ 10.2 |  How hard is it to decarbonise heavy vehicles in transport like long-haul trucks, ships and planes?**

There are few obvious solutions to decarbonising heavy vehicles like international ships and planes. The main focus has been increased efficiency, which so far has not prevented these large vehicles from becoming the fastest-growing source of GHG globally. 
These vehicles likely need alternative fuels that can be fitted to the present propulsion systems. Emerging demonstrations suggest that ammonia, advanced biofuels, or synthetic fuels could become commercial.
Electric propulsion using hydrogen fuel cells or Li-ion batteries could work with short-haul aviation and shipping, but the large long-lived vessels and aircraft likely need alternative liquid fuels for most major long-distance functions.
Advanced biofuels, if sourced from resources with low GHG footprints, offer decarbonisation opportunities. As shown in Chapters 2, 6, and 12, there are multiple issues constraining traditional biofuels. Sustainable land management and feedstocks, as well as R&D efforts to improve lignocellulosic conversion routes, are key to maximising the mitigation potential from advanced biofuels.
Synthetic jet and marine fuels can be made using CO2 captured with DAC/BECCS and low-carbon hydrogen. These fuels may also have less contrails-based climate impacts and lower emissions of local air pollutants. However, these fuels still require significant R&D and demonstration.
The deployment of low-carbon aviation and shipping fuels that support decarbonisation of the transport sector will likely require changes to national and international governance structures.


**FAQ 10.3 |  How can governments, communities and individuals reduce demand and be more efficient in consuming transport energy?**

Cities can reduce their transport-related fuel consumption by around 25% through combinations of more compact land use and less car-dependent transport infrastructure.
More traditional programmes for reducing unnecessary high-energy travel through behaviour change programmes (e.g., taxes on fuel, parking, and vehicles, or subsidies for alternative low-carbon modes) continue to be evaluated, with mixed results due to the dominance of time savings in an individual’s decision-making.
The circular economy, the shared economy, and digitalisation trends can support systemic changes that lead to reductions in demand for transport services or expand the use of more efficient transport modes.
COVID-19 lockdowns have confirmed the transformative value of telecommuting, replacing significant numbers of work and personal journeys, as well as promoting local active transport. These changes may not last and impacts on productivity and health are still to be fully evaluated.
Solutions for individual households and businesses involving pledges and shared communities that set new cultural means of reducing fossil fuel consumption, especially in transport, are setting out new approaches for how climate change mitigation can be achieved.
")

# ╔═╡ f93f61ba-f048-4c6a-9d08-6fbffb55dbac
Foldable("FAQ 11: Industry",md"

**FAQ 11.1 |  What are the key options to reduce industrial emissions?**

Industry has a  diverse set of greenhouse gas (GHG) emission sources across subsectors. To decarbonise industry requires that we pursue several options simultaneously. These include energy efficiency, materials demand management, improving materials efficiency, more circular material flows, electrification, as well as carbon capture and utilisation (CCU) and carbon capture and storage (CCS). Improved materials efficiency and recycling reduces the need for primary resource extraction and the energy-intensive primary processing steps. Future recycling may include chemical recycling of plastics if quality requirements make mechanical recycling difficult. One approach, albeit energy intensive, is to break down waste plastics to produce new monomer building blocks, potentially based on biogenic carbon and hydrogen instead of fossil feedstock. Hydrogen can also be used as a reduction agent instead of coke and coal in ironmaking. Process emissions from cement production can be captured and stored or used as feedstock for chemicals and materials. Electricity and hydrogen needs can be very large but the potential for renewable electricity, possibly in combination with other low carbon options, is not a limiting factor.


**FAQ 11.2 | How costly is industrial decarbonisation and will there be synergies 
or conflicts with sustainable development?**

In most cases and in early stages of deployment, decarbonisation through electrification or CCS will make the primary production of basic materials such as cement, steel, or polyethylene more expensive. However, demand management, energy and materials efficiency, and more circular material flows can dampen the effect of such cost increases. In addition, the cost of energy-intensive materials is typically a very small part of the total price of products, such as an appliance, a bottle of soda or a building, so the effect on consumers is very small. Getting actors to pay more for zero-emission materials is a challenge in supply chains with a strong focus on competitiveness and cutting costs, but it is not a significant problem for the broader economy. Reduced demand for services such as square metres of living space or kilometres of car travel is an option where material living standards are already high. If material living standards are very low, increased material use is often needed for more sustainable development. The options of materials and energy efficiency, and more circular material flows, generally have synergies with sustainable development. Increased use of electricity, hydrogen, CCU and CCS may have both positive and negative implications for sustainable development and thus require careful assessment and implementation for different contexts.


**FAQ 11.3 | What needs to happen for a low-carbon industry transition?**

Broad and sequential policy strategies for industrial development and decarbonisation that pursue several mitigation options atthe same time are more likely to result in resource-efficient and cost-effective emission reductions. Industrial decarbonisation is a relatively new field and thus building capacity for industrial transition governance is motivated. For example, policy to support materials efficiency or fundamental technology shifts in primary processes is less developed than energy efficiency policy and carbon pricing. Based on shared visions or pathways for a zero-emission industry, industrial policy needs to support development of new technologies and solutions as well as market creation for low- and zero-emission materials and products. This implies coordination across several policy domains including research and innovation, waste and recycling, product standards, digitalisation, taxes, regional development, infrastructure, public procurement, permit procedures and more to make the transition to a carbon neutral industry. International competition means that trade rules must be evolved to not conflict with industrial decarbonisation. Some local and regional economies may be disadvantaged from the transition which can motivate re-education and other support.
")

# ╔═╡ 71c734b1-2a56-4981-9ed1-f8873926a8e9
Foldable("FAQ 12: Cross-sectoral Perspectives",md"

**FAQ 12.1 |  How could new technologies to remove carbon dioxide from the atmosphere 
contribute to climate change mitigation?**

Limiting the increase in warming to well below 2°C, and achieving net zero CO2 or GHG emissions, will require anthropogenic CO2 removal from the atmosphere.
The carbon dioxide removal (CDR) methods studied so far have different removal potentials, costs, co-benefits and side effects. 
Some biological methods for achieving CDR, like afforestation/reforestation or wetland restoration, have long been practised. 
If implemented well, these practices can provide a  range of co-benefits, but they can also have adverse side effects such as biodiversity loss or food price increases. Other chemical and geochemical approaches to CDR include direct air carbon capture and storage (DACCS), enhanced weathering or ocean alkalinity enhancement. They are generally less vulnerable to reversal than biological methods.
DACCS uses chemicals that bind to CO2 directly from the air; the CO2 is then removed from the sorbent and stored underground or mineralised. Enhanced weathering involves the mining of rocks containing minerals that naturally absorb CO2 from the atmosphere over geological timescales, which are crushed to increase the surface area and spread on soils (or elsewhere) where they absorb atmospheric CO2. Ocean alkalinity enhancement involves the extraction, processing, and dissolution of minerals and addition to the ocean where they enhance sequestration of CO2 as bicarbonate and carbonate ions in the ocean.


**FAQ 12.2 |  Why is it important to assess mitigation measures from a systemic perspective, rather than only looking at their potential to reduce greenhouse gas (GHG) emissions?**

Mitigation measures do not only reduce GHGs, but have wider impacts. They can result in decreases or increases in GHG emissions in another sector or part of the value chain from where they are applied. They can have wider environmental (e.g., air and water pollution, biodiversity), social (e.g., employment creation, health) and economic (e.g., growth, investment) co-benefits or adverse side effects. Mitigation and adaptation can also be linked. Taking these considerations into account can help to enhance the benefits of mitigation action, and avoid unintended consequences, as well as provide a stronger case for achieving political and societal support and raising the finances required for implementation.


**FAQ 12.3 |  Why do we need a food systems approach for assessing GHG emissions and mitigation 
opportunities from food systems?**

Activities associated with the food system caused about one-third of total anthropogenic GHG emissions in 2015, distributed across all sectors. Agriculture and fisheries produce crops and animal-source food, which are partly processed in the food industry, packed, distributed, retailed, cooked, and finally eaten. Each step is associated with resource use, waste generation, and GHG emissions.
A food systems approach helps identify critical areas as well as novel and alternative approaches to mitigation on both the supply side and the demand side of the food system. But complex co-impacts need to be considered and mitigation measures tailored to the specific context. International cooperation and governance of global food trade can support both mitigation and adaptation.
There is large scope for emissions reduction in both cropland and grazing production, and also in food processing, storage and distribution. Emerging options such as plant-based alternatives to animal food products and food from cellular agriculture are receiving increasing attention, but their mitigation potential is still uncertain and depends on the GHG intensity of associated energy systems due to relatively high energy needs. Diet changes can reduce GHG emissions and also improve health in groups with excess consumption of calories and animal food products, which is mainly prevalent in developed countries. Reductions in food loss and waste can help reduce GHG emissions further.
Recommendations to buy local food and avoid packaging can contribute to reducing GHG emissions but should not be generalised, as trade-offs exist with food waste, GHG footprint at farm gate, and accessibility to diverse healthy diets.

")

# ╔═╡ e8d66a16-e2e3-401f-bba0-634a6b19b07a
Foldable("FAQ 13: National and Sub-national Policies and Institutions",md"

**FAQ 13.1 | What roles do national play in climate mitigation, and how can they be effective?**

Institutions and governance underpin mitigation. Climate laws provide the legal basis for action, organisations through which policies are developed and implemented, and frameworks through which diverse actors interact. Specific organisations, such as expert committees, can inform emission reduction targets, inform the creation of policies and packages, and strengthen accountability. 
Institutions enable strategic thinking, building consensus among stakeholders and enhanced coordination. 
Climate governance is constrained and enabled by countries’ political systems, material endowments and their ideas, values and belief systems, which leads to a variety of country-specific approaches to climate mitigation. 
Countries follow diverse approaches. Some countries focus on greenhouse gases emissions by adopting comprehensive climate laws and creating dedicated ministries and institutions focused on climate change. Others consider climate change among broader scope of policy objectives, such as poverty alleviation, energy security, economic development and co-benefits of climate actions, with the involvement of existing agencies and ministries. See also FAQ 13.3 on sub-national climate mitigation.


**FAQ 13.2 | What policies and strategies can be applied to combat climate change?**

Institutions can enable creation of mitigation and sectoral policy instruments; policy packages for low-carbon system transition, and economy-wide measures for systemic restructuring. Policy instruments to reduce greenhouses gas emissions include economic instruments, regulatory instruments and other approaches. 
Economic policy instruments directly influence prices to achieve emission reductions through taxes, permit trading, offset systems, subsidies, and border tax adjustments, and are effective in promoting implementation of low-cost emissions reductions. Regulatory instruments help achieve specific mitigation outcomes particularly in sectoral applications, by establishing technology or performance requirements. Other instruments include information programmes, government provision of goods, services and infrastructure, divestment strategies, and voluntary agreements between governments and private firms.
Climate policy instruments can be sector-specific or economy-wide and could be applied at national, regional, or local levels. 
Policymakers may directly target GHG emission reduction or seek to achieve multiple objectives, such as urbanisation or energy security, with the effect of reducing emissions. In practice, climate mitigation policy instruments operate in combination with other policy tools, and require attention to the interaction effects between instruments. At all levels of governance, coverage, stringency and design of climate policies define their efficiency in reducing greenhouse gases emissions.
Policy packages, when designed with attention to interactive effects, local governance context, and harnessed to a clear vision for change, are better able to support socio-technical transitions and shifts in development pathways toward low-carbon futures than individual policies. See also Chapter 14 on international climate governance. 


**FAQ 13.3 | How can actions at the sub-national level contribute to climate mitigation?**

Sub-national actors (for example individuals, organisations, jurisdictions and networks at regional, local and city levels) often have a remit over areas salient to climate mitigation, such as land-use planning, waste management, infrastructure, housing, and community development. Despite constraints on legal authority and dependence on national policy priorities in many countries, subnational climate change policies exist in more than 120 countries. However, they often lack national support, funding, and capacity, and adequate coordination with other scales. Sub-national climate action in support of specific goals is more likely to succeed when linked to local issues such as travel congestion alleviation, air pollution control.
The main drivers of climate actions at sub-national levels include high levels of citizen concern, jurisdictional authority and funding, institutional capacity, national level support and effective linkage to development objectives. Sub-national governments often initiate and implement policy experiments that could be scaled to other levels of governance.

")

# ╔═╡ fddbff2d-d746-47c9-9426-85f5a0be077e
Foldable("FAQ 14: International Cooperation",md"

**FAQ 14.1 |  Is international cooperation working?**

Yes, to an extent. Countries’ emissions were in line with their internationally agreed targets: the collective greenhouse gas (GHG) mitigation target for Annex I countries in the UNFCCC to return to their 1990 emissions levels by 2000, and their individual targets in the Kyoto Protocol for 2008–12. Numerous studies suggest that participation in the Kyoto Protocol led to substantial reductions in national GHG emissions, as well increased levels of innovation and investment in low-carbon technologies. In this latter respect, the Kyoto Protocol set in motion some of the transformational changes that will be required to meet the temperature goal of the Paris Agreement. It is too soon to tell whether the processes and commitments embodied in the Paris Agreement will be effective in achieving its stated goals with respect to limiting temperature rise, adaptation, and financial flows. There is, however, evidence that its entry into force has been a contributing factor to many countries’ adopting mid-century targets of net-zero GHG or CO2 emissions. 


**FAQ 14.2 | What is the future role of international cooperation in the context 
of the Paris Agreement?**

Continued international cooperation remains critically important both to stimulate countries’ enhanced levels of mitigation ambition, and through various means of support to increase the likelihood that they achieve these objectives. The latter is particularly the case in developing countries, where mitigation efforts often rely on bilateral and multilateral cooperation on low-carbon finance, technology support, capacity building, and enhanced South-South cooperation. The Paris Agreement is structured around Nationally Determined Contributions that are subject to an international oversight system, and bolstered through international support. 
The international oversight system is designed to generate transparency and accountability for individual emissions reduction contributions, and regular moments for stock-taking of these efforts towards global goals. Such enhanced transparency may instil confidence and trust, and foster solidarity among nations, with theory-based arguments that this will lead to greater levels of ambition. Together with other cooperative agreements at the sub-global and sectoral levels, as well as a  growing number of transnational networks and initiatives, the implementation of all of these mechanisms is likely to play an important role in making political, economic, and social conditions more favourable to ambitious mitigation efforts in the context of sustainable development and efforts to eradicate poverty. 


**FAQ 14.3 |  Are there any important gaps in international cooperation, which will need to be filled in order for countries to achieve the objectives of the Paris Agreement, such as holding temperature increase to well below 2°C and pursuing efforts towards 1.5°C above pre-industrial levels?**

While international cooperation is contributing to global mitigation efforts, its effects are far from uniform. Cooperation has contributed to setting a global direction of travel, and to falling greenhouse gas emissions in many countries and avoided emissions in others. It remains to be seen whether it can achieve the kind of transformational changes needed to achieve the Paris Agreement’s long-term global goals. There appears to be a large potential role for international cooperation to better address sector-specific technical and infrastructure challenges that are associated with such transformational changes. Finalising the rules to pursue voluntary cooperation, such as through international carbon market mechanisms and public climate finance in the implementation of NDCs, without compromising environmental integrity, may play an important role in accelerating mitigation efforts in developing countries. Finally, there is room for international cooperation to more explicitly address transboundary issues associated with carbon dioxide removal and solar radiation management.
")

# ╔═╡ 37610e11-3ce6-4da7-835a-8ee36e8cb12c
Foldable("FAQ 15: Investment and Finance",md"

**FAQ 15.1 |  What’s the role of climate finance and the finance sector for a transformation towards a sustainable future?**

The Paris Agreement has widened the scope of all financial flows from climate finance only to the full alignment of finance flows with the long-term goals of the Paris Agreement. While climate finance relates historically to the financial support of developed countries to developing countries, the Paris Agreement and its Article 2.1(c) have developed a new narrative that goes much beyond traditional flows and relates to all sectors and actors. Finance flows are consistent when the effects are either neutral with or without positive climate co-benefits to climate objectives; or explicitly targeted to climate benefits in adaptation and/or mitigation result areas. Climate-related financial risk is still massively underestimated by financial institutions, financial decision-makers more generally and also among public sector stakeholders, limiting the sector’s potential of being an enabler of the transition. The private sector has started to recognise climate-related risks and consequently redirect investment flows. Dynamics vary across sectors and regions with the financial sector being an enabler of transitions in only some selected (sub-)sectors and regions. Consistent, credible, timely and forward-looking political leadership remains central to strengthen the financial sector as enabler.


**FAQ 15.2 |  What’s the current status of global climate finance and the alignment of global financial flows with the Paris Agreement?**

There is no agreed definition of climate finance. The term ‘climate finance’ is applied to the financial resources devoted to addressing climate change by all public and private actors from global to local scales, including international financial flows to developing countries to assist them in addressing climate change. Total climate finance includes all financial flows whose expected effect aims to reduce net greenhouse gas (GHG) emissions and/or to enhance resilience to the impacts of current and projected climate change. 
This includes private and public funds, domestic and international flows and expenditures. Tracking of climate finance flows faces limitations, in particular for national climate finance flows.
Progress on the alignment of financial flows with low GHG emissions pathways remains slow. Annual global climate finance flows are on an upward trend since the Fifth Assessment Report, according to the Climate Policy Initiative reaching more than USD630 billion in 2019/2020, however, growth has likely slowed down and flows remain significantly below needs. This is driven by barriers within and outside the financial sector. More than 90% of financing is allocated to mitigation activities despite the strong economic rationale of adaptation action. Adjusting for higher estimates on current flows for energy efficiency based on International Energy Agency data, the dominance of mitigation becomes even stronger. Persistently high levels of both public and private fossil-fuel related financing as well as other misaligned flows continue to be of major concern despite recent commitments. 
Significant progress has been made in the commercial finance sector with regard to the awareness of climate risks resulting from inadequate financial flows and climate action. However, a more consequent investment and policy decision-making that enables a rapid redirection of financial flows is needed. Regulatory support as a catalyser is an essential driver of such redirections. Dynamics across sectors and regions vary, with some being better positioned to close financing gaps and to benefit from an enabling role of finance in the short-term.


**FAQ 15.3 |  What defines a financing gap, and where are the critically identified gaps?**

A financing gap is defined as the difference between current flows and average needs to meet the long-term goals of the Paris Agreement. Gaps are driven by various barriers inside (short-termism, information gaps, home bias, limited visibility of future pipelines) and outside (e.g., missing pricing of externalities, missing regulatory frameworks) of the financial sector. Current mitigation financing flows come in significantly below average needs across all regions and sectors despite the availability of sufficient capital on a global basis. Globally, yearly climate finance flows have to increase by a factor between three and six to meet average annual needs between 2020 and 2030.
Gaps are in particular concerning for many developing countries, with COVID-19 exacerbating the macroeconomic outlook and fiscal space for governments. Also, limited institutional capacity represents a key barrier for many developing countries, burdening risk perceptions and access to appropriately priced financing as well as limiting their ability to actively manage the transformation. 
Existing fundamental inequities in access to finance, as well as its terms and conditions, and countries’ exposure to physical impacts of climate change, overall result in a worsening outlook for a global just transition
")

# ╔═╡ 3f1b72cd-89ad-4540-aee3-96dadac0a7eb
Foldable("FAQ 16: Innovation, Technology Development and Transfer",md"

**FAQ 16.1 |  Will innovation and technological changes be enough to meet the Paris 
Agreement objectives?**

The Paris Agreement stressed the importance of development and transfer of technologies to improve resilience to climate change and to reduce greenhouse gas emissions. However, innovation and even fast technological change will not be enough to achieve Paris Agreement mitigation objectives. Other changes are necessary across the production and consumption system and the society in general, including behavioural changes.
Technological changes never happen in a vacuum; they are always accompanied by, for instance, people changing habits, companies changing value chains, or banks changing risk profiles. Therefore, technological changes driven by holistic approaches can contribute to accelerate and spread those changes towards the achievement of climate and sustainable development goals.
In innovation studies, such systemic approaches are said to strengthen the functions of technological or national innovation systems, so that climate-friendly technologies can flourish. Innovation policies can help respond to local priorities and prevent unintended and undesirable consequences of technological change, such as unequal access to new technologies across countries and between income groups, environmental degradation and negative effects on employment.


**FAQ 16.2 |  What can be done to promote innovation for climate change and the widespread diffusion of low-emission and climate-resilient technology?**

The speed and success of innovation processes could be enhanced with the involvement of a  wider range of actors from the industry, research and financial communities working in partnerships at national, regional and international levels. Public policies play a critical role to bring together these different actors and create the necessary enabling conditions, including financial support, through different instruments as well as institutional and human capacities.
The increasing complexity of technologies requires cooperation if their widespread diffusion is to be achieved. Cooperation includes the necessary knowledge flow within and between countries and regions. This knowledge flow can take the form of exchanging experiences, ideas, skills, and practices, among others.


**FAQ 16.3 |  What is the role of international technology cooperation in addressing 
climate change?**

Technologies that are currently known but not yet widely used need to be spread around the world, and adapted to local preferences and conditions. Innovation capabilities are required not only to adapt new technologies for local use, but also to create new markets and business models. International technology cooperation can serve that purpose.
In fact, evidence shows that international cooperation on technology development and transfer can help developing countries to achieve their climate goals more effectively and, if this is done properly, can also help to addressing other sustainable development goals. Many initiatives exist both regionally and globally to help countries in achieving technology development and transfer through partnerships and research collaboration that include developed and developing countries, with a key role for technological institutions and universities. Enhancing current activities would help an effective, long-term global response to climate change, 
while promoting sustainable development.
Globalisation of production and supply of goods and services, including innovation and new technologies, may open up opportunities for developing countries to advance technology diffusion; however, so far not all countries have benefitted from the globalisation of innovation due to different barriers, such as access to finance and technical capabilities. These asymmetries between countries in the globalisation process can also lead to dependencies on foreign knowledge and providers.
Not all technology cooperation directly results in mitigation outcomes. Overall, technology transfer broadly has focused on enhancing climate technology absorption and deployment in developing countries as well as research, development and demonstration, and knowledge spillovers.
The Paris Agreement also reflects this view by noting that countries shall strengthen cooperative action on technology development and transfer regarding two main aspects: (i) promoting collaborative approaches to research and development; and (ii) facilitating access to technology to developing country Parties.

")

# ╔═╡ 5dca8e59-636c-4994-ab56-0eb8bce06fc6
Foldable("FAQ 17: Accelerating the Transition in the Context of Sustainable Development",md"

**FAQ 17.1 | Will decarbonisation efforts slow or accelerate sustainable development transitions?**

Sustainable development offers a comprehensive pathway to achieving ambitious climate change mitigation goals. Sustainable development requires the pursuit of synergies and the avoidance of trade-offs between the economic, social and environmental dimensions of development. It can thus provide pathways that accelerate progress towards ambitious climate change mitigation goals. Factoring in equality and distributional effects will be particularly important in the pursuit of sustainable policies and partnerships, and in accelerating the transition to sustainable development. Using climate change as a key conduit can only work if synergies across sectors are exploited and if policy implementation is supported by national and international partnerships.
The speed, quality, depth and scale of the transition will depend on the developmental starting point, that is, on explicit goals as well as the enabling environment consisting of individual behaviour, mindsets, beliefs and actions, social cohesion, governance, policies, institutions, social and technological innovations, and so on. The integration of both climate change mitigation and adaptation policies in sustainable development is also essential in the establishment of fair and robust transformation pathways.


**FAQ 17.2 | What role do considerations of justice and inclusivity play in the transition towards sustainable development?**

Negative economic and social impacts in some regions could emerge as a consequence of ambitious climate change mitigation policies if these are not aligned with key sustainable development aspirations such as those represented by the Sustainable Development Goals (SDGs) on ‘no poverty, energy-, water- and food access’, and so on, which could in turn slow down the transition process. Nonetheless, many climate change mitigation policies could generate incomes, new jobs and other benefits. Capturing these benefits could require specific policies and investments to be targeted directly towards including all parts of society in the new activities and industries created by the climate change mitigation policies, and that activities that are reduced in the context of transitions to a low-carbon future, including industries and geographical areas, are seeing new opportunities. Poor understanding of how governance at multiple levels can meet these challenges to the transition may fail to make significant progress in relation to national policies and a  global climate agreement. It may therefore either support or weaken the climate architecture, thus constituting a limiting factor.


**FAQ 17.3 | How critical are the roles of institutions in accelerating the transition and what can governance enable?**

Institutions are critical in accelerating the transition towards sustainable development: they can help to shape climate change response strategies in terms of both adaptation and mitigation. Local institutions are the custodians of critical adaptation services, ranging from the mobilisation of resources, skills development and capacity-building to the dissemination of critical strategies. 
Transitions towards sustainable development are mediated by actors within particular institutions, the governance mechanisms they use as implementing tools and the political coalitions they form to enable action. Patterns of production and consumption have implications for a low-carbon development, and many of these patterns can act as barriers or opportunities towards sustainable development. Trade policies, international economic issues and international financial flows can positively support the speed and scale of the transition; alternatively, they can have negative impacts on policies that may inhibit the process. Nonetheless, contextual factors are a fundamental part of the change process, and institutions and their governance systems provide pathways that can influence contextual realities on the ground. For instance, politically vested interests may lead powerful lobby groups or coalition networks to influence the direction of the transition, or they could put pressure on a given political elite through the imposition of regulatory standards, taxation, incentives and policies that may speed or delay the transition process. Civil-society institutions, such as NGOs or research centres, can act as effective governance ‘watchdogs’ in the transition process, particularly when they exercise a challenge function and question government actions in respect of transitions related to sustainable development.
")

# ╔═╡ c151dd47-6465-47a6-b215-f26c5f025e30
md"""
\
🎈 More FAQs are indicated below in the **Further readings** section!
"""

# ╔═╡ 89362c55-b0be-4f02-a3cf-ce1f0c8742b6


# ╔═╡ cf52512b-3f42-4fdf-8dc1-7991e3af0262


# ╔═╡ 0b474409-d0bd-470e-a1da-bdd93e6e9390
md"""
# Further readings

- [Overarching Frequently Asked Questions and Answers](https://www.ipcc.ch/report/ar6/wg2/downloads/faqs/IPCC_AR6_WGII_Overaching_OutreachFAQs.pdf), IPCC Sixth Assessment Report. Website: [Frequently Asked Questions | Climate Change 2022: Impacts, Adaptation and Vulnerability](https://www.ipcc.ch/report/ar6/wg2/about/frequently-asked-questions)


- [Frequently Asked Questions from Chapters and Cross-Chapter Papers](https://www.ipcc.ch/report/ar6/wg2/downloads/faqs/IPCC\_AR6\_WGII\_FAQ-Brochure.pdf), IPCC Sixth Assessment Report. Website: [Frequently Asked Questions | Climate Change 2022: Impacts, Adaptation and Vulnerability](https://www.ipcc.ch/report/ar6/wg2/about/frequently-asked-questions)


- Chris Mooney, Naema Ahmed, John Muysken, [How we can keep global warming below the 1.5 degrees Celsius goal - Washington Post](https://www.washingtonpost.com/climate-environment/interactive/2022/global-warming-1-5-celsius-scenarios/?itid=pr_enhanced-template_1), Dec. 1, 2022. 


- Isabel Lopes Cardoso, [Terras Raras: uma questão ambiental ou de defesa dos direitos humanos?](https://gerador.eu/terras-raras-uma-questao-ambiental-ou-de-defesa-dos-direitos-humanos/), Gerador, Jan. 28, 2023. 

"""

# ╔═╡ 18723d8d-0b36-46f0-bde2-62a46cd40cfe


# ╔═╡ 0e2d3599-a52f-4f61-b240-df8e8f42afa7
md"""
# References
"""

# ╔═╡ 6889a03e-ccb7-4ba6-a5bb-fdf9f6f08e49
md"""
[^1]: [The European Association for Storage of Energy](https://ease-storage.eu/)

[^2]: [IRENA – International Renewable Energy Agency](https://www.irena.org/)

[^3]: [ClimateChange | United Nations](https://www.un.org/en/climatechange)

[^4]: Chris Mooney, Naema Ahmed, John Muysken, [How we can keep global warming below the 1.5 degrees Celsius goal - Washington Post](https://www.washingtonpost.com/climate-environment/interactive/2022/global-warming-1-5-celsius-scenarios/?itid=pr_enhanced-template_1), Dec. 1, 2022. 

[^5]: [Goal 7: Affordable and clean energy - The Global Goals](https://www.globalgoals.org/goals/7-affordable-and-clean-energy/)

[^6]: [IPCC, 2022: Climate Change 2022: Impacts, Adaptation, and Vulnerability.](https://www.ipcc.ch/report/ar6/wg2/) Contribution of Working Group II to the Sixth Assessment Report of the Intergovernmental Panel on Climate Change, Cambridge University, 3056 pp., doi:10.1017/9781009325844.

[^7]: [Australian Rare Earths - Rare Earth Elements Are - Overview](https://www.australianrareearths.com/what-are-rare-earths.html)

[^8]: European Commission, Directorate-General for Internal Market, Industry, Entrepreneurship and SMEs, Blengini, G., El Latunussa, C., Eynard, U., et al., Study on the EU's list of critical raw materials (2020) : final report, Publications Office, 2020, DOI: [https://data.europa.eu/doi/10.2873/11619](https://data.europa.eu/doi/10.2873/11619)

[^9]: Isabel Lopes Cardoso, [Terras Raras: uma questão ambiental ou de defesa dos direitos humanos?](https://gerador.eu/terras-raras-uma-questao-ambiental-ou-de-defesa-dos-direitos-humanos/), Gerador, Jan. 28, 2023.

[^10]: [Alan Edelman, "our first climate model", Introduction to Computational Thinking, MIT, spring 2021](https://computationalthinking.mit.edu/Spring21/our_first_climate_model/)

[^11]: [Henri Drake, "Introduction to Climate Modeling, Nonlinear Dynamics and Stability", Introduction to Computational Thinking, MIT, fall 2020](https://computationalthinking.mit.edu/Fall20/lecture20/)

"""

# ╔═╡ 42c7fb46-5eb2-4935-b708-7eb537a18019
md"""
#DOI("10.1137/141000671")
Esta função de (ShortCodes.jl) não está operacional: 
[HTTP 500 Error with DOI · Issue #11 · hellemo/ShortCodes.jl](https://github.com/hellemo/ShortCodes.jl/issues/11)
""";

# ╔═╡ 33221bd6-6393-4ae7-a8f3-fd5ee4320da3


# ╔═╡ 661a1f69-676c-44b0-9004-5ad534125fd0
md"""
# Notebook
"""

# ╔═╡ e1dafd4b-250a-445c-a85b-31a931faf08e
md"""
!!! info
	## Julia programming and Pluto notebooks
	Know more about: [_Julia_/_Pluto_](https://github.com/Ricardo-Luis/notebooks/blob/main/SAE/README.md)
"""

# ╔═╡ e746aadb-057c-40ba-8ee0-e2a1006eae75
md"""
!!! info
	In the table of contents of this notebook, the topics marked with "💻" allow user interaction. 
"""

# ╔═╡ cd6e09dd-34e7-4071-acd8-d1359ffcc952
md"""
Notebook made in `Julia` scientific programming language, version $(VERSION).\
**Time to first plot**: up to 3 min.\
**Computer**: $(Sys.cpu_info()[1].model).
"""

# ╔═╡ 2fd8141d-16ef-41fa-b778-36108bbdb767
md"""
Documentation of used `Julia` packages: [PlutoUI](https://github.com/JuliaPluto/PlutoUI.jl), [ShortCodes](https://github.com/hellemo/ShortCodes.jl), [PlutoTeachingTools](https://github.com/JuliaPluto/PlutoTeachingTools.jl), [DifferentialEquations](https://github.com/SciML/DifferentialEquations.jl), [Plots](https://docs.juliaplots.org/stable/), [LinearAlgebra](https://docs.julialang.org/en/v1/stdlib/LinearAlgebra/), [CSV](https://github.com/JuliaData/CSV.jl), [DataFrames](https://dataframes.juliadata.org/stable/).

"""

# ╔═╡ 18d471e7-c6d0-4073-8a31-beeb3a3f9c81
TableOfContents()

# ╔═╡ fd3c9443-b61f-4741-a60d-d557e1c9f765
begin
	# other stuff:
	isel_logo="https://www.isel.pt/sites/default/files/NoPath%20-%20Copy%402x_0.png"
	julia_logo="https://github.com/JuliaLang/julia-logo-graphics/blob/master/images/julia-logo-color.png?raw=true"
end;

# ╔═╡ 3090cc16-913e-46ac-9fd8-a167a869baf3
TwoColumnWideRight(md"$(Resource(isel_logo, :height => 95))", md"
$\textbf{\color{green}{Master in Electrical Engineering}}$ 
$\text{Energy Storage Systems}$")

# ╔═╡ 151a53c9-f93d-4925-9c18-c0e21e9e2265
md"""
 ---
"""

# ╔═╡ 0245aefb-25b0-4a02-a972-a0a8e121cf47
md"""

This notebook is designed in `Julia` programming language for the Energy Storage Systems MSc. course (ISEL\MEE) \
**Ricardo Luís** \
(Adjunct Professor) \
ISEL, 02/Mar/2023

"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
CSV = "336ed68f-0bac-5ca0-87d4-7b16caf5d00b"
DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
DifferentialEquations = "0c46a032-eb83-5123-abaf-570d42b7fbaa"
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
Plots = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
PlutoTeachingTools = "661c6b06-c737-4d37-b85c-46df65de6f69"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
ShortCodes = "f62ebe17-55c5-4640-972f-b59c0dd11ccf"

[compat]
CSV = "~0.10.9"
DataFrames = "~1.5.0"
DifferentialEquations = "~7.7.0"
Plots = "~1.38.6"
PlutoTeachingTools = "~0.2.6"
PlutoUI = "~0.7.50"
ShortCodes = "~0.3.4"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.4"
manifest_format = "2.0"
project_hash = "830cbea3d9d385f8b73784ad4807be0f5069af92"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[deps.Adapt]]
deps = ["LinearAlgebra", "Requires"]
git-tree-sha1 = "cc37d689f599e8df4f464b2fa3870ff7db7492ef"
uuid = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
version = "3.6.1"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.ArnoldiMethod]]
deps = ["LinearAlgebra", "Random", "StaticArrays"]
git-tree-sha1 = "62e51b39331de8911e4a7ff6f5aaf38a5f4cc0ae"
uuid = "ec485272-7323-5ecc-a04f-4719b315124d"
version = "0.2.0"

[[deps.ArrayInterface]]
deps = ["Adapt", "LinearAlgebra", "Requires", "SnoopPrecompile", "SparseArrays", "SuiteSparse"]
git-tree-sha1 = "ec9c36854b569323551a6faf2f31fda15e3459a7"
uuid = "4fba245c-0d91-5ea0-9b3e-6abc04ee57a9"
version = "7.2.0"

[[deps.ArrayInterfaceCore]]
deps = ["LinearAlgebra", "SnoopPrecompile", "SparseArrays", "SuiteSparse"]
git-tree-sha1 = "e5f08b5689b1aad068e01751889f2f615c7db36d"
uuid = "30b0a656-2188-435a-8636-2ec0e6a096e2"
version = "0.1.29"

[[deps.ArrayLayouts]]
deps = ["FillArrays", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "4aff5fa660eb95c2e0deb6bcdabe4d9a96bc4667"
uuid = "4c555306-a7a7-4459-81d9-ec55ddd5c99a"
version = "0.8.18"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.BandedMatrices]]
deps = ["ArrayLayouts", "FillArrays", "LinearAlgebra", "SnoopPrecompile", "SparseArrays"]
git-tree-sha1 = "ee75410471c18f40d57eb53840bc705a74566f23"
uuid = "aae01518-5342-5314-be14-df237901396f"
version = "0.17.16"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.BitFlags]]
git-tree-sha1 = "43b1a4a8f797c1cddadf60499a8a077d4af2cd2d"
uuid = "d1d4a3ce-64b1-5f1a-9ba4-7e7e69966f35"
version = "0.1.7"

[[deps.BitTwiddlingConvenienceFunctions]]
deps = ["Static"]
git-tree-sha1 = "0c5f81f47bbbcf4aea7b2959135713459170798b"
uuid = "62783981-4cbd-42fc-bca8-16325de8dc4b"
version = "0.1.5"

[[deps.BoundaryValueDiffEq]]
deps = ["BandedMatrices", "DiffEqBase", "FiniteDiff", "ForwardDiff", "LinearAlgebra", "NLsolve", "Reexport", "SciMLBase", "SparseArrays"]
git-tree-sha1 = "ed8e837bfb3d1e3157022c9636ec1c722b637318"
uuid = "764a87c0-6b3e-53db-9096-fe964310641d"
version = "2.11.0"

[[deps.Bzip2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "19a35467a82e236ff51bc17a3a44b69ef35185a2"
uuid = "6e34b625-4abd-537c-b88f-471c36dfa7a0"
version = "1.0.8+0"

[[deps.CEnum]]
git-tree-sha1 = "eb4cb44a499229b3b8426dcfb5dd85333951ff90"
uuid = "fa961155-64e5-5f13-b03f-caf6b980ea82"
version = "0.4.2"

[[deps.CPUSummary]]
deps = ["CpuId", "IfElse", "Static"]
git-tree-sha1 = "2c144ddb46b552f72d7eafe7cc2f50746e41ea21"
uuid = "2a0fbf3d-bb9c-48f3-b0a9-814d99fd7ab9"
version = "0.2.2"

[[deps.CSV]]
deps = ["CodecZlib", "Dates", "FilePathsBase", "InlineStrings", "Mmap", "Parsers", "PooledArrays", "SentinelArrays", "SnoopPrecompile", "Tables", "Unicode", "WeakRefStrings", "WorkerUtilities"]
git-tree-sha1 = "c700cce799b51c9045473de751e9319bdd1c6e94"
uuid = "336ed68f-0bac-5ca0-87d4-7b16caf5d00b"
version = "0.10.9"

[[deps.Cairo_jll]]
deps = ["Artifacts", "Bzip2_jll", "CompilerSupportLibraries_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "JLLWrappers", "LZO_jll", "Libdl", "Pixman_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "4b859a208b2397a7a623a03449e4636bdb17bcf2"
uuid = "83423d85-b0ee-5818-9007-b63ccbeb887a"
version = "1.16.1+1"

[[deps.Calculus]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "f641eb0a4f00c343bbc32346e1217b86f3ce9dad"
uuid = "49dc2e85-a5d0-5ad3-a950-438e2897f1b9"
version = "0.5.1"

[[deps.ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "c6d890a52d2c4d55d326439580c3b8d0875a77d9"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.15.7"

[[deps.ChangesOfVariables]]
deps = ["ChainRulesCore", "LinearAlgebra", "Test"]
git-tree-sha1 = "485193efd2176b88e6622a39a246f8c5b600e74e"
uuid = "9e997f8a-9a97-42d5-a9f1-ce6bfc15e2c0"
version = "0.1.6"

[[deps.CloseOpenIntervals]]
deps = ["Static", "StaticArrayInterface"]
git-tree-sha1 = "70232f82ffaab9dc52585e0dd043b5e0c6b714f1"
uuid = "fb6a15b2-703c-40df-9091-08a04967cfa9"
version = "0.1.12"

[[deps.CodeTracking]]
deps = ["InteractiveUtils", "UUIDs"]
git-tree-sha1 = "4f619d394ac521dc59cb80a2cd8f78578e483a9d"
uuid = "da1fd8a2-8d9e-5ec2-8556-3022fb5608a2"
version = "1.2.1"

[[deps.CodecZlib]]
deps = ["TranscodingStreams", "Zlib_jll"]
git-tree-sha1 = "9c209fb7536406834aa938fb149964b985de6c83"
uuid = "944b1d66-785c-5afd-91f1-9de20f533193"
version = "0.7.1"

[[deps.ColorSchemes]]
deps = ["ColorTypes", "ColorVectorSpace", "Colors", "FixedPointNumbers", "Random", "SnoopPrecompile"]
git-tree-sha1 = "aa3edc8f8dea6cbfa176ee12f7c2fc82f0608ed3"
uuid = "35d6a980-a343-548e-a6ea-1d62b119f2f4"
version = "3.20.0"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

[[deps.ColorVectorSpace]]
deps = ["ColorTypes", "FixedPointNumbers", "LinearAlgebra", "SpecialFunctions", "Statistics", "TensorCore"]
git-tree-sha1 = "600cc5508d66b78aae350f7accdb58763ac18589"
uuid = "c3611d14-8923-5661-9e6a-0046d554d3a4"
version = "0.9.10"

[[deps.Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "fc08e5930ee9a4e03f84bfb5211cb54e7769758a"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.12.10"

[[deps.CommonSolve]]
git-tree-sha1 = "9441451ee712d1aec22edad62db1a9af3dc8d852"
uuid = "38540f10-b2f7-11e9-35d8-d573e4eb0ff2"
version = "0.2.3"

[[deps.CommonSubexpressions]]
deps = ["MacroTools", "Test"]
git-tree-sha1 = "7b8a93dba8af7e3b42fecabf646260105ac373f7"
uuid = "bbf7d656-a473-5ed7-a52c-81e309532950"
version = "0.3.0"

[[deps.Compat]]
deps = ["Dates", "LinearAlgebra", "UUIDs"]
git-tree-sha1 = "61fdd77467a5c3ad071ef8277ac6bd6af7dd4c04"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.6.0"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.1+0"

[[deps.ConstructionBase]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "89a9db8d28102b094992472d333674bd1a83ce2a"
uuid = "187b0558-2788-49d3-abe0-74a17ed4e7c9"
version = "1.5.1"

[[deps.Contour]]
git-tree-sha1 = "d05d9e7b7aedff4e5b51a029dced05cfb6125781"
uuid = "d38c429a-6771-53c6-b99e-75d170b6e991"
version = "0.6.2"

[[deps.CpuId]]
deps = ["Markdown"]
git-tree-sha1 = "fcbb72b032692610bfbdb15018ac16a36cf2e406"
uuid = "adafc99b-e345-5852-983c-f28acb93d879"
version = "0.3.1"

[[deps.Crayons]]
git-tree-sha1 = "249fe38abf76d48563e2f4556bebd215aa317e15"
uuid = "a8cc5b0e-0ffa-5ad4-8c14-923d3ee1735f"
version = "4.1.1"

[[deps.DataAPI]]
git-tree-sha1 = "e8119c1a33d267e16108be441a287a6981ba1630"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.14.0"

[[deps.DataFrames]]
deps = ["Compat", "DataAPI", "Future", "InlineStrings", "InvertedIndices", "IteratorInterfaceExtensions", "LinearAlgebra", "Markdown", "Missings", "PooledArrays", "PrettyTables", "Printf", "REPL", "Random", "Reexport", "SentinelArrays", "SnoopPrecompile", "SortingAlgorithms", "Statistics", "TableTraits", "Tables", "Unicode"]
git-tree-sha1 = "aa51303df86f8626a962fccb878430cdb0a97eee"
uuid = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
version = "1.5.0"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "d1fff3a548102f48987a52a2e0d114fa97d730f0"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.13"

[[deps.DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.DelayDiffEq]]
deps = ["ArrayInterface", "DataStructures", "DiffEqBase", "LinearAlgebra", "Logging", "OrdinaryDiffEq", "Printf", "RecursiveArrayTools", "Reexport", "SciMLBase", "SimpleNonlinearSolve", "UnPack"]
git-tree-sha1 = "dde3fa2cfc91fb5d39ba2a7dc7e4383e0a6665b3"
uuid = "bcd4f6db-9728-5f36-b5f7-82caef46ccdb"
version = "5.41.0"

[[deps.DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[deps.DensityInterface]]
deps = ["InverseFunctions", "Test"]
git-tree-sha1 = "80c3e8639e3353e5d2912fb3a1916b8455e2494b"
uuid = "b429d917-457f-4dbc-8f4c-0cc954292b1d"
version = "0.4.0"

[[deps.DiffEqBase]]
deps = ["ArrayInterface", "ChainRulesCore", "DataStructures", "Distributions", "DocStringExtensions", "EnumX", "FastBroadcast", "ForwardDiff", "FunctionWrappers", "FunctionWrappersWrappers", "LinearAlgebra", "Logging", "Markdown", "MuladdMacro", "Parameters", "PreallocationTools", "Printf", "RecursiveArrayTools", "Reexport", "Requires", "SciMLBase", "Setfield", "SparseArrays", "Static", "StaticArraysCore", "Statistics", "Tricks", "TruncatedStacktraces", "ZygoteRules"]
git-tree-sha1 = "a057a5fe2a6a05f28ef1092d5974a0c2986be23c"
uuid = "2b5f629d-d688-5b77-993f-72d75c75574e"
version = "6.121.1"

[[deps.DiffEqCallbacks]]
deps = ["DataStructures", "DiffEqBase", "ForwardDiff", "LinearAlgebra", "Markdown", "NLsolve", "Parameters", "RecipesBase", "RecursiveArrayTools", "SciMLBase", "StaticArraysCore"]
git-tree-sha1 = "b497f63a13fe37e03ed7ac72d71b72aad17b46c4"
uuid = "459566f4-90b8-5000-8ac3-15dfb0a30def"
version = "2.26.0"

[[deps.DiffEqNoiseProcess]]
deps = ["DiffEqBase", "Distributions", "GPUArraysCore", "LinearAlgebra", "Markdown", "Optim", "PoissonRandom", "QuadGK", "Random", "Random123", "RandomNumbers", "RecipesBase", "RecursiveArrayTools", "Requires", "ResettableStacks", "SciMLBase", "StaticArrays", "Statistics"]
git-tree-sha1 = "2c4ed3eedb87579bfe9f20ecc2440de06b9f3b89"
uuid = "77a26b50-5914-5dd7-bc55-306e6241c503"
version = "5.16.0"

[[deps.DiffResults]]
deps = ["StaticArraysCore"]
git-tree-sha1 = "782dd5f4561f5d267313f23853baaaa4c52ea621"
uuid = "163ba53b-c6d8-5494-b064-1a9d43ac40c5"
version = "1.1.0"

[[deps.DiffRules]]
deps = ["IrrationalConstants", "LogExpFunctions", "NaNMath", "Random", "SpecialFunctions"]
git-tree-sha1 = "a4ad7ef19d2cdc2eff57abbbe68032b1cd0bd8f8"
uuid = "b552c78f-8df3-52c6-915a-8e097449b14b"
version = "1.13.0"

[[deps.DifferentialEquations]]
deps = ["BoundaryValueDiffEq", "DelayDiffEq", "DiffEqBase", "DiffEqCallbacks", "DiffEqNoiseProcess", "JumpProcesses", "LinearAlgebra", "LinearSolve", "NonlinearSolve", "OrdinaryDiffEq", "Random", "RecursiveArrayTools", "Reexport", "SciMLBase", "SteadyStateDiffEq", "StochasticDiffEq", "Sundials"]
git-tree-sha1 = "ac145e3d718157c679fc4febf2fcef73ec77b067"
uuid = "0c46a032-eb83-5123-abaf-570d42b7fbaa"
version = "7.7.0"

[[deps.Distances]]
deps = ["LinearAlgebra", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "3258d0659f812acde79e8a74b11f17ac06d0ca04"
uuid = "b4f34e82-e78d-54a5-968a-f98e89d6e8f7"
version = "0.10.7"

[[deps.Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[deps.Distributions]]
deps = ["ChainRulesCore", "DensityInterface", "FillArrays", "LinearAlgebra", "PDMats", "Printf", "QuadGK", "Random", "SparseArrays", "SpecialFunctions", "Statistics", "StatsBase", "StatsFuns", "Test"]
git-tree-sha1 = "fb372fc76a20edda014dfc2cdb33f23ef80feda6"
uuid = "31c24e10-a181-5473-b8eb-7969acd0382f"
version = "0.25.85"

[[deps.DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "2fb1e02f2b635d0845df5d7c167fec4dd739b00d"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.9.3"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.DualNumbers]]
deps = ["Calculus", "NaNMath", "SpecialFunctions"]
git-tree-sha1 = "5837a837389fccf076445fce071c8ddaea35a566"
uuid = "fa6b7ba4-c1ee-5f82-b5fc-ecf0adba8f74"
version = "0.6.8"

[[deps.EnumX]]
git-tree-sha1 = "bdb1942cd4c45e3c678fd11569d5cccd80976237"
uuid = "4e289a0a-7415-4d19-859d-a7e5c4648b56"
version = "1.0.4"

[[deps.Expat_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "bad72f730e9e91c08d9427d5e8db95478a3c323d"
uuid = "2e619515-83b5-522b-bb60-26c02a35a201"
version = "2.4.8+0"

[[deps.ExponentialUtilities]]
deps = ["Adapt", "ArrayInterface", "GPUArraysCore", "GenericSchur", "LinearAlgebra", "Printf", "SnoopPrecompile", "SparseArrays", "libblastrampoline_jll"]
git-tree-sha1 = "fb7dbef7d2631e2d02c49e2750f7447648b0ec9b"
uuid = "d4d017d3-3776-5f7e-afef-a10c40355c18"
version = "1.24.0"

[[deps.ExprTools]]
git-tree-sha1 = "56559bbef6ca5ea0c0818fa5c90320398a6fbf8d"
uuid = "e2ba6199-217a-4e67-a87a-7c52f15ade04"
version = "0.1.8"

[[deps.FFMPEG]]
deps = ["FFMPEG_jll"]
git-tree-sha1 = "b57e3acbe22f8484b4b5ff66a7499717fe1a9cc8"
uuid = "c87230d0-a227-11e9-1b43-d7ebe4e7570a"
version = "0.4.1"

[[deps.FFMPEG_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "JLLWrappers", "LAME_jll", "Libdl", "Ogg_jll", "OpenSSL_jll", "Opus_jll", "PCRE2_jll", "Pkg", "Zlib_jll", "libaom_jll", "libass_jll", "libfdk_aac_jll", "libvorbis_jll", "x264_jll", "x265_jll"]
git-tree-sha1 = "74faea50c1d007c85837327f6775bea60b5492dd"
uuid = "b22a6f82-2f65-5046-a5b2-351ab43fb4e5"
version = "4.4.2+2"

[[deps.FastBroadcast]]
deps = ["ArrayInterface", "LinearAlgebra", "Polyester", "Static", "StaticArrayInterface", "StrideArraysCore"]
git-tree-sha1 = "d1248fceea0b26493fd33e8e9e8c553270da03bd"
uuid = "7034ab61-46d4-4ed7-9d0f-46aef9175898"
version = "0.2.5"

[[deps.FastClosures]]
git-tree-sha1 = "acebe244d53ee1b461970f8910c235b259e772ef"
uuid = "9aa1b823-49e4-5ca5-8b0f-3971ec8bab6a"
version = "0.3.2"

[[deps.FastLapackInterface]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "c1293a93193f0ae94be7cf338d33e162c39d8788"
uuid = "29a986be-02c6-4525-aec4-84b980013641"
version = "1.2.9"

[[deps.FilePathsBase]]
deps = ["Compat", "Dates", "Mmap", "Printf", "Test", "UUIDs"]
git-tree-sha1 = "e27c4ebe80e8699540f2d6c805cc12203b614f12"
uuid = "48062228-2e41-5def-b9a4-89aafe57970f"
version = "0.9.20"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.FillArrays]]
deps = ["LinearAlgebra", "Random", "SparseArrays", "Statistics"]
git-tree-sha1 = "d3ba08ab64bdfd27234d3f61956c966266757fe6"
uuid = "1a297f60-69ca-5386-bcde-b61e274b549b"
version = "0.13.7"

[[deps.FiniteDiff]]
deps = ["ArrayInterface", "LinearAlgebra", "Requires", "Setfield", "SparseArrays", "StaticArrays"]
git-tree-sha1 = "ed1b56934a2f7a65035976985da71b6a65b4f2cf"
uuid = "6a86dc24-6348-571c-b903-95158fe2bd41"
version = "2.18.0"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Fontconfig_jll]]
deps = ["Artifacts", "Bzip2_jll", "Expat_jll", "FreeType2_jll", "JLLWrappers", "Libdl", "Libuuid_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "21efd19106a55620a188615da6d3d06cd7f6ee03"
uuid = "a3f928ae-7b40-5064-980b-68af3947d34b"
version = "2.13.93+0"

[[deps.Formatting]]
deps = ["Printf"]
git-tree-sha1 = "8339d61043228fdd3eb658d86c926cb282ae72a8"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.2"

[[deps.ForwardDiff]]
deps = ["CommonSubexpressions", "DiffResults", "DiffRules", "LinearAlgebra", "LogExpFunctions", "NaNMath", "Preferences", "Printf", "Random", "SpecialFunctions", "StaticArrays"]
git-tree-sha1 = "00e252f4d706b3d55a8863432e742bf5717b498d"
uuid = "f6369f11-7733-5829-9624-2563aa707210"
version = "0.10.35"

[[deps.FreeType2_jll]]
deps = ["Artifacts", "Bzip2_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "87eb71354d8ec1a96d4a7636bd57a7347dde3ef9"
uuid = "d7e528f0-a631-5988-bf34-fe36492bcfd7"
version = "2.10.4+0"

[[deps.FriBidi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "aa31987c2ba8704e23c6c8ba8a4f769d5d7e4f91"
uuid = "559328eb-81f9-559d-9380-de523a88c83c"
version = "1.0.10+0"

[[deps.FunctionWrappers]]
git-tree-sha1 = "d62485945ce5ae9c0c48f124a84998d755bae00e"
uuid = "069b7b12-0de2-55c6-9aab-29f3d0a68a2e"
version = "1.1.3"

[[deps.FunctionWrappersWrappers]]
deps = ["FunctionWrappers"]
git-tree-sha1 = "b104d487b34566608f8b4e1c39fb0b10aa279ff8"
uuid = "77dc65aa-8811-40c2-897b-53d922fa7daf"
version = "0.1.3"

[[deps.Future]]
deps = ["Random"]
uuid = "9fa8497b-333b-5362-9e8d-4d0656e87820"

[[deps.GLFW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libglvnd_jll", "Pkg", "Xorg_libXcursor_jll", "Xorg_libXi_jll", "Xorg_libXinerama_jll", "Xorg_libXrandr_jll"]
git-tree-sha1 = "d972031d28c8c8d9d7b41a536ad7bb0c2579caca"
uuid = "0656b61e-2033-5cc2-a64a-77c0f6c09b89"
version = "3.3.8+0"

[[deps.GPUArraysCore]]
deps = ["Adapt"]
git-tree-sha1 = "1cd7f0af1aa58abc02ea1d872953a97359cb87fa"
uuid = "46192b85-c4d5-4398-a991-12ede77f4527"
version = "0.1.4"

[[deps.GR]]
deps = ["Artifacts", "Base64", "DelimitedFiles", "Downloads", "GR_jll", "HTTP", "JSON", "Libdl", "LinearAlgebra", "Pkg", "Preferences", "Printf", "Random", "Serialization", "Sockets", "TOML", "Tar", "Test", "UUIDs", "p7zip_jll"]
git-tree-sha1 = "660b2ea2ec2b010bb02823c6d0ff6afd9bdc5c16"
uuid = "28b8d3ca-fb5f-59d9-8090-bfdbd6d07a71"
version = "0.71.7"

[[deps.GR_jll]]
deps = ["Artifacts", "Bzip2_jll", "Cairo_jll", "FFMPEG_jll", "Fontconfig_jll", "GLFW_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll", "Pixman_jll", "Qt5Base_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "d5e1fd17ac7f3aa4c5287a61ee28d4f8b8e98873"
uuid = "d2c73de3-f751-5644-a686-071e5b155ba9"
version = "0.71.7+0"

[[deps.GenericSchur]]
deps = ["LinearAlgebra", "Printf"]
git-tree-sha1 = "fb69b2a645fa69ba5f474af09221b9308b160ce6"
uuid = "c145ed77-6b09-5dd9-b285-bf645a82121e"
version = "0.5.3"

[[deps.Gettext_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "9b02998aba7bf074d14de89f9d37ca24a1a0b046"
uuid = "78b55507-aeef-58d4-861c-77aaff3498b1"
version = "0.21.0+0"

[[deps.Glib_jll]]
deps = ["Artifacts", "Gettext_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Libiconv_jll", "Libmount_jll", "PCRE2_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "d3b3624125c1474292d0d8ed0f65554ac37ddb23"
uuid = "7746bdde-850d-59dc-9ae8-88ece973131d"
version = "2.74.0+2"

[[deps.Graphite2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "344bf40dcab1073aca04aa0df4fb092f920e4011"
uuid = "3b182d85-2403-5c21-9c21-1e1f0cc25472"
version = "1.3.14+0"

[[deps.Graphs]]
deps = ["ArnoldiMethod", "Compat", "DataStructures", "Distributed", "Inflate", "LinearAlgebra", "Random", "SharedArrays", "SimpleTraits", "SparseArrays", "Statistics"]
git-tree-sha1 = "1cf1d7dcb4bc32d7b4a5add4232db3750c27ecb4"
uuid = "86223c79-3864-5bf0-83f7-82e725a168b6"
version = "1.8.0"

[[deps.Grisu]]
git-tree-sha1 = "53bb909d1151e57e2484c3d1b53e19552b887fb2"
uuid = "42e2da0e-8278-4e71-bc24-59509adca0fe"
version = "1.0.2"

[[deps.HTTP]]
deps = ["Base64", "CodecZlib", "Dates", "IniFile", "Logging", "LoggingExtras", "MbedTLS", "NetworkOptions", "OpenSSL", "Random", "SimpleBufferStream", "Sockets", "URIs", "UUIDs"]
git-tree-sha1 = "37e4657cd56b11abe3d10cd4a1ec5fbdb4180263"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "1.7.4"

[[deps.HarfBuzz_jll]]
deps = ["Artifacts", "Cairo_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "Graphite2_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg"]
git-tree-sha1 = "129acf094d168394e80ee1dc4bc06ec835e510a3"
uuid = "2e76f6c2-a576-52d4-95c1-20adfe4de566"
version = "2.8.1+1"

[[deps.HostCPUFeatures]]
deps = ["BitTwiddlingConvenienceFunctions", "IfElse", "Libdl", "Static"]
git-tree-sha1 = "734fd90dd2f920a2f1921d5388dcebe805b262dc"
uuid = "3e5b6fbb-0976-4d2c-9146-d79de83f2fb0"
version = "0.1.14"

[[deps.HypergeometricFunctions]]
deps = ["DualNumbers", "LinearAlgebra", "OpenLibm_jll", "SpecialFunctions", "Test"]
git-tree-sha1 = "709d864e3ed6e3545230601f94e11ebc65994641"
uuid = "34004b35-14d8-5ef3-9330-4cdb6864b03a"
version = "0.3.11"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "c47c5fa4c5308f27ccaac35504858d8914e102f9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.4"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[deps.IfElse]]
git-tree-sha1 = "debdd00ffef04665ccbb3e150747a77560e8fad1"
uuid = "615f187c-cbe4-4ef1-ba3b-2fcf58d6d173"
version = "0.1.1"

[[deps.Inflate]]
git-tree-sha1 = "5cd07aab533df5170988219191dfad0519391428"
uuid = "d25df0c9-e2be-5dd7-82c8-3ad0b3e990b9"
version = "0.1.3"

[[deps.IniFile]]
git-tree-sha1 = "f550e6e32074c939295eb5ea6de31849ac2c9625"
uuid = "83e8ac13-25f8-5344-8a64-a9f2b223428f"
version = "0.5.1"

[[deps.InlineStrings]]
deps = ["Parsers"]
git-tree-sha1 = "9cc2baf75c6d09f9da536ddf58eb2f29dedaf461"
uuid = "842dd82b-1e85-43dc-bf29-5d0ee9dffc48"
version = "1.4.0"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.InverseFunctions]]
deps = ["Test"]
git-tree-sha1 = "49510dfcb407e572524ba94aeae2fced1f3feb0f"
uuid = "3587e190-3f89-42d0-90ee-14403ec27112"
version = "0.1.8"

[[deps.InvertedIndices]]
git-tree-sha1 = "82aec7a3dd64f4d9584659dc0b62ef7db2ef3e19"
uuid = "41ab1584-1d38-5bbf-9106-f11c6c58b48f"
version = "1.2.0"

[[deps.IrrationalConstants]]
git-tree-sha1 = "630b497eafcc20001bba38a4651b327dcfc491d2"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.2.2"

[[deps.IterativeSolvers]]
deps = ["LinearAlgebra", "Printf", "Random", "RecipesBase", "SparseArrays"]
git-tree-sha1 = "1169632f425f79429f245113b775a0e3d121457c"
uuid = "42fd0dbc-a981-5370-80f2-aaf504508153"
version = "0.9.2"

[[deps.IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[deps.JLFzf]]
deps = ["Pipe", "REPL", "Random", "fzf_jll"]
git-tree-sha1 = "f377670cda23b6b7c1c0b3893e37451c5c1a2185"
uuid = "1019f520-868f-41f5-a6de-eb00f4b6a39c"
version = "0.1.5"

[[deps.JLLWrappers]]
deps = ["Preferences"]
git-tree-sha1 = "abc9885a7ca2052a736a600f7fa66209f96506e1"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.4.1"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[deps.JSON3]]
deps = ["Dates", "Mmap", "Parsers", "SnoopPrecompile", "StructTypes", "UUIDs"]
git-tree-sha1 = "84b10656a41ef564c39d2d477d7236966d2b5683"
uuid = "0f8b85d8-7281-11e9-16c2-39a750bddbf1"
version = "1.12.0"

[[deps.JpegTurbo_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "6f2675ef130a300a112286de91973805fcc5ffbc"
uuid = "aacddb02-875f-59d6-b918-886e6ef4fbf8"
version = "2.1.91+0"

[[deps.JuliaInterpreter]]
deps = ["CodeTracking", "InteractiveUtils", "Random", "UUIDs"]
git-tree-sha1 = "d9ae7a9081d9b1a3b2a5c1d3dac5e2fdaafbd538"
uuid = "aa1ae85d-cabe-5617-a682-6adf51b2e16a"
version = "0.9.22"

[[deps.JumpProcesses]]
deps = ["ArrayInterface", "DataStructures", "DiffEqBase", "DocStringExtensions", "FunctionWrappers", "Graphs", "LinearAlgebra", "Markdown", "PoissonRandom", "Random", "RandomNumbers", "RecursiveArrayTools", "Reexport", "SciMLBase", "StaticArrays", "TreeViews", "UnPack"]
git-tree-sha1 = "7af8d30e281ce558807917b69ba16575d05f412b"
uuid = "ccbc3e58-028d-4f4c-8cd5-9ae44345cda5"
version = "9.5.1"

[[deps.KLU]]
deps = ["LinearAlgebra", "SparseArrays", "SuiteSparse_jll"]
git-tree-sha1 = "764164ed65c30738750965d55652db9c94c59bfe"
uuid = "ef3ab10e-7fda-4108-b977-705223b18434"
version = "0.4.0"

[[deps.Krylov]]
deps = ["LinearAlgebra", "Printf", "SparseArrays"]
git-tree-sha1 = "dd90aacbfb622f898a97c2a4411ac49101ebab8a"
uuid = "ba0b0d4f-ebba-5204-a429-3ac8c609bfb7"
version = "0.9.0"

[[deps.KrylovKit]]
deps = ["ChainRulesCore", "GPUArraysCore", "LinearAlgebra", "Printf"]
git-tree-sha1 = "1a5e1d9941c783b0119897d29f2eb665d876ecf3"
uuid = "0b1a1467-8014-51b9-945f-bf0ae24f4b77"
version = "0.6.0"

[[deps.LAME_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "f6250b16881adf048549549fba48b1161acdac8c"
uuid = "c1c5ebd0-6772-5130-a774-d5fcae4a789d"
version = "3.100.1+0"

[[deps.LERC_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "bf36f528eec6634efc60d7ec062008f171071434"
uuid = "88015f11-f218-50d7-93a8-a6af411a945d"
version = "3.0.0+1"

[[deps.LZO_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e5b909bcf985c5e2605737d2ce278ed791b89be6"
uuid = "dd4b983a-f0e5-5f8d-a1b7-129d4a5fb1ac"
version = "2.10.1+0"

[[deps.LaTeXStrings]]
git-tree-sha1 = "f2355693d6778a178ade15952b7ac47a4ff97996"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.3.0"

[[deps.Latexify]]
deps = ["Formatting", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "OrderedCollections", "Printf", "Requires"]
git-tree-sha1 = "2422f47b34d4b127720a18f86fa7b1aa2e141f29"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.15.18"

[[deps.LayoutPointers]]
deps = ["ArrayInterface", "LinearAlgebra", "ManualMemory", "SIMDTypes", "Static", "StaticArrayInterface"]
git-tree-sha1 = "88b8f66b604da079a627b6fb2860d3704a6729a1"
uuid = "10f19ff3-798f-405d-979b-55457f8fc047"
version = "0.1.14"

[[deps.Lazy]]
deps = ["MacroTools"]
git-tree-sha1 = "1370f8202dac30758f3c345f9909b97f53d87d3f"
uuid = "50d2b5c4-7a5e-59d5-8109-a42b560f39c0"
version = "0.15.1"

[[deps.LevyArea]]
deps = ["LinearAlgebra", "Random", "SpecialFunctions"]
git-tree-sha1 = "56513a09b8e0ae6485f34401ea9e2f31357958ec"
uuid = "2d8b4e74-eb68-11e8-0fb9-d5eb67b50637"
version = "1.0.0"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.3"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "7.84.0+0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.10.2+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.Libffi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "0b4a5d71f3e5200a7dff793393e09dfc2d874290"
uuid = "e9f186c6-92d2-5b65-8a66-fee21dc1b490"
version = "3.2.2+1"

[[deps.Libgcrypt_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgpg_error_jll", "Pkg"]
git-tree-sha1 = "64613c82a59c120435c067c2b809fc61cf5166ae"
uuid = "d4300ac3-e22c-5743-9152-c294e39db1e4"
version = "1.8.7+0"

[[deps.Libglvnd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll", "Xorg_libXext_jll"]
git-tree-sha1 = "6f73d1dd803986947b2c750138528a999a6c7733"
uuid = "7e76a0d4-f3c7-5321-8279-8d96eeed0f29"
version = "1.6.0+0"

[[deps.Libgpg_error_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "c333716e46366857753e273ce6a69ee0945a6db9"
uuid = "7add5ba3-2f88-524e-9cd5-f83b8a55f7b8"
version = "1.42.0+0"

[[deps.Libiconv_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "c7cb1f5d892775ba13767a87c7ada0b980ea0a71"
uuid = "94ce4f54-9a6c-5748-9c1c-f9c7231a4531"
version = "1.16.1+2"

[[deps.Libmount_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "9c30530bf0effd46e15e0fdcf2b8636e78cbbd73"
uuid = "4b2f31a3-9ecc-558c-b454-b3730dcb73e9"
version = "2.35.0+0"

[[deps.Libtiff_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "LERC_jll", "Libdl", "Pkg", "Zlib_jll", "Zstd_jll"]
git-tree-sha1 = "3eb79b0ca5764d4799c06699573fd8f533259713"
uuid = "89763e89-9b03-5906-acba-b20f662cd828"
version = "4.4.0+0"

[[deps.Libuuid_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "7f3efec06033682db852f8b3bc3c1d2b0a0ab066"
uuid = "38a345b3-de98-5d2b-a5d3-14cd9215e700"
version = "2.36.0+0"

[[deps.LineSearches]]
deps = ["LinearAlgebra", "NLSolversBase", "NaNMath", "Parameters", "Printf"]
git-tree-sha1 = "7bbea35cec17305fc70a0e5b4641477dc0789d9d"
uuid = "d3d80556-e9d4-5f37-9878-2ab0fcc64255"
version = "7.2.0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.LinearSolve]]
deps = ["ArrayInterface", "DocStringExtensions", "FastLapackInterface", "GPUArraysCore", "IterativeSolvers", "KLU", "Krylov", "KrylovKit", "LinearAlgebra", "Preferences", "RecursiveFactorization", "Reexport", "SciMLBase", "SciMLOperators", "Setfield", "SnoopPrecompile", "SparseArrays", "Sparspak", "SuiteSparse", "UnPack"]
git-tree-sha1 = "d1fce810e9a4213607f0182cf25ffd6ce13e19b6"
uuid = "7ed4a6bd-45f5-4d41-b270-4a48e9bafcae"
version = "1.37.0"

[[deps.LogExpFunctions]]
deps = ["ChainRulesCore", "ChangesOfVariables", "DocStringExtensions", "InverseFunctions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "0a1b7c2863e44523180fdb3146534e265a91870b"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.23"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.LoggingExtras]]
deps = ["Dates", "Logging"]
git-tree-sha1 = "cedb76b37bc5a6c702ade66be44f831fa23c681e"
uuid = "e6f89c97-d47a-5376-807f-9c37f3926c36"
version = "1.0.0"

[[deps.LoopVectorization]]
deps = ["ArrayInterface", "ArrayInterfaceCore", "CPUSummary", "ChainRulesCore", "CloseOpenIntervals", "DocStringExtensions", "ForwardDiff", "HostCPUFeatures", "IfElse", "LayoutPointers", "LinearAlgebra", "OffsetArrays", "PolyesterWeave", "SIMDTypes", "SLEEFPirates", "SnoopPrecompile", "SpecialFunctions", "Static", "StaticArrayInterface", "ThreadingUtilities", "UnPack", "VectorizationBase"]
git-tree-sha1 = "2acf6874142d05d5d1ad49e8d3786b8cd800936d"
uuid = "bdcacae8-1622-11e9-2a5c-532679323890"
version = "0.12.152"

[[deps.LoweredCodeUtils]]
deps = ["JuliaInterpreter"]
git-tree-sha1 = "60168780555f3e663c536500aa790b6368adc02a"
uuid = "6f1432cf-f94c-5a45-995e-cdbf5db27b0b"
version = "2.3.0"

[[deps.MIMEs]]
git-tree-sha1 = "65f28ad4b594aebe22157d6fac869786a255b7eb"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "0.1.4"

[[deps.MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "42324d08725e200c23d4dfb549e0d5d89dede2d2"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.10"

[[deps.ManualMemory]]
git-tree-sha1 = "bcaef4fc7a0cfe2cba636d84cda54b5e4e4ca3cd"
uuid = "d125e4d3-2237-4719-b19c-fa641b8a4667"
version = "0.1.8"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS]]
deps = ["Dates", "MbedTLS_jll", "MozillaCACerts_jll", "Random", "Sockets"]
git-tree-sha1 = "03a9b9718f5682ecb107ac9f7308991db4ce395b"
uuid = "739be429-bea8-5141-9913-cc70e7f3736d"
version = "1.1.7"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.0+0"

[[deps.Measures]]
git-tree-sha1 = "c13304c81eec1ed3af7fc20e75fb6b26092a1102"
uuid = "442fdcdd-2543-5da2-b0f3-8c86c306513e"
version = "0.3.2"

[[deps.Memoize]]
deps = ["MacroTools"]
git-tree-sha1 = "2b1dfcba103de714d31c033b5dacc2e4a12c7caa"
uuid = "c03570c3-d221-55d1-a50c-7939bbd78826"
version = "0.4.4"

[[deps.Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "f66bdc5de519e8f8ae43bdc598782d35a25b1272"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.1.0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.2.1"

[[deps.MuladdMacro]]
git-tree-sha1 = "cac9cc5499c25554cba55cd3c30543cff5ca4fab"
uuid = "46d2c3a1-f734-5fdb-9937-b9b9aeba4221"
version = "0.2.4"

[[deps.NLSolversBase]]
deps = ["DiffResults", "Distributed", "FiniteDiff", "ForwardDiff"]
git-tree-sha1 = "a0b464d183da839699f4c79e7606d9d186ec172c"
uuid = "d41bc354-129a-5804-8e4c-c37616107c6c"
version = "7.8.3"

[[deps.NLsolve]]
deps = ["Distances", "LineSearches", "LinearAlgebra", "NLSolversBase", "Printf", "Reexport"]
git-tree-sha1 = "019f12e9a1a7880459d0173c182e6a99365d7ac1"
uuid = "2774e3e8-f4cf-5e23-947b-6d7e65073b56"
version = "4.5.1"

[[deps.NaNMath]]
deps = ["OpenLibm_jll"]
git-tree-sha1 = "0877504529a3e5c3343c6f8b4c0381e57e4387e4"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "1.0.2"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.NonlinearSolve]]
deps = ["ArrayInterface", "DiffEqBase", "FiniteDiff", "ForwardDiff", "LinearAlgebra", "LinearSolve", "RecursiveArrayTools", "Reexport", "SciMLBase", "SimpleNonlinearSolve", "SnoopPrecompile", "SparseArrays", "SparseDiffTools", "StaticArraysCore", "UnPack"]
git-tree-sha1 = "3f856788ba532419c07ba2e0dc37b06e5d784992"
uuid = "8913a72c-1f9b-4ce2-8d82-65094dcecaec"
version = "1.5.0"

[[deps.OffsetArrays]]
deps = ["Adapt"]
git-tree-sha1 = "82d7c9e310fe55aa54996e6f7f94674e2a38fcb4"
uuid = "6fe1bfb0-de20-5000-8ca7-80f57d26f881"
version = "1.12.9"

[[deps.Ogg_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "887579a3eb005446d514ab7aeac5d1d027658b8f"
uuid = "e7412a2a-1a6e-54c0-be00-318e2571c051"
version = "1.3.5+1"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.20+0"

[[deps.OpenLibm_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "05823500-19ac-5b8b-9628-191a04bc5112"
version = "0.8.1+0"

[[deps.OpenSSL]]
deps = ["BitFlags", "Dates", "MozillaCACerts_jll", "OpenSSL_jll", "Sockets"]
git-tree-sha1 = "6503b77492fd7fcb9379bf73cd31035670e3c509"
uuid = "4d8831e6-92b7-49fb-bdf8-b643e874388c"
version = "1.3.3"

[[deps.OpenSSL_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "9ff31d101d987eb9d66bd8b176ac7c277beccd09"
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "1.1.20+0"

[[deps.OpenSpecFun_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "13652491f6856acfd2db29360e1bbcd4565d04f1"
uuid = "efe28fd5-8261-553b-a9e1-b2916fc3738e"
version = "0.5.5+0"

[[deps.Optim]]
deps = ["Compat", "FillArrays", "ForwardDiff", "LineSearches", "LinearAlgebra", "NLSolversBase", "NaNMath", "Parameters", "PositiveFactorizations", "Printf", "SparseArrays", "StatsBase"]
git-tree-sha1 = "1903afc76b7d01719d9c30d3c7d501b61db96721"
uuid = "429524aa-4258-5aef-a3af-852621145aeb"
version = "1.7.4"

[[deps.Opus_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "51a08fb14ec28da2ec7a927c4337e4332c2a4720"
uuid = "91d4177d-7536-5919-b921-800302f37372"
version = "1.3.2+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[deps.OrdinaryDiffEq]]
deps = ["Adapt", "ArrayInterface", "DataStructures", "DiffEqBase", "DocStringExtensions", "ExponentialUtilities", "FastBroadcast", "FastClosures", "FiniteDiff", "ForwardDiff", "FunctionWrappersWrappers", "IfElse", "LinearAlgebra", "LinearSolve", "Logging", "LoopVectorization", "MacroTools", "MuladdMacro", "NLsolve", "NonlinearSolve", "Polyester", "PreallocationTools", "Preferences", "RecursiveArrayTools", "Reexport", "SciMLBase", "SciMLNLSolve", "SimpleNonlinearSolve", "SnoopPrecompile", "SparseArrays", "SparseDiffTools", "StaticArrayInterface", "StaticArrays", "TruncatedStacktraces", "UnPack"]
git-tree-sha1 = "5370a27bf89e6ac04517c6b9778295cdb7a411f8"
uuid = "1dea7af3-3e70-54e6-95c3-0bf5283fa5ed"
version = "6.48.0"

[[deps.PCRE2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "efcefdf7-47ab-520b-bdef-62a2eaa19f15"
version = "10.40.0+0"

[[deps.PDMats]]
deps = ["LinearAlgebra", "SparseArrays", "SuiteSparse"]
git-tree-sha1 = "67eae2738d63117a196f497d7db789821bce61d1"
uuid = "90014a1f-27ba-587c-ab20-58faa44d9150"
version = "0.11.17"

[[deps.Parameters]]
deps = ["OrderedCollections", "UnPack"]
git-tree-sha1 = "34c0e9ad262e5f7fc75b10a9952ca7692cfc5fbe"
uuid = "d96e819e-fc66-5662-9728-84c9c7592b0a"
version = "0.12.3"

[[deps.Parsers]]
deps = ["Dates", "SnoopPrecompile"]
git-tree-sha1 = "6f4fbcd1ad45905a5dee3f4256fabb49aa2110c6"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.5.7"

[[deps.Pipe]]
git-tree-sha1 = "6842804e7867b115ca9de748a0cf6b364523c16d"
uuid = "b98c9c47-44ae-5843-9183-064241ee97a0"
version = "1.3.0"

[[deps.Pixman_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b4f5d02549a10e20780a24fce72bea96b6329e29"
uuid = "30392449-352a-5448-841d-b1acce4e97dc"
version = "0.40.1+0"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.8.0"

[[deps.PlotThemes]]
deps = ["PlotUtils", "Statistics"]
git-tree-sha1 = "1f03a2d339f42dca4a4da149c7e15e9b896ad899"
uuid = "ccf2f8ad-2431-5c83-bf29-c5338b663b6a"
version = "3.1.0"

[[deps.PlotUtils]]
deps = ["ColorSchemes", "Colors", "Dates", "Printf", "Random", "Reexport", "SnoopPrecompile", "Statistics"]
git-tree-sha1 = "c95373e73290cf50a8a22c3375e4625ded5c5280"
uuid = "995b91a9-d308-5afd-9ec6-746e21dbc043"
version = "1.3.4"

[[deps.Plots]]
deps = ["Base64", "Contour", "Dates", "Downloads", "FFMPEG", "FixedPointNumbers", "GR", "JLFzf", "JSON", "LaTeXStrings", "Latexify", "LinearAlgebra", "Measures", "NaNMath", "Pkg", "PlotThemes", "PlotUtils", "Preferences", "Printf", "REPL", "Random", "RecipesBase", "RecipesPipeline", "Reexport", "RelocatableFolders", "Requires", "Scratch", "Showoff", "SnoopPrecompile", "SparseArrays", "Statistics", "StatsBase", "UUIDs", "UnicodeFun", "Unzip"]
git-tree-sha1 = "da1d3fb7183e38603fcdd2061c47979d91202c97"
uuid = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
version = "1.38.6"

[[deps.PlutoHooks]]
deps = ["InteractiveUtils", "Markdown", "UUIDs"]
git-tree-sha1 = "072cdf20c9b0507fdd977d7d246d90030609674b"
uuid = "0ff47ea0-7a50-410d-8455-4348d5de0774"
version = "0.0.5"

[[deps.PlutoLinks]]
deps = ["FileWatching", "InteractiveUtils", "Markdown", "PlutoHooks", "Revise", "UUIDs"]
git-tree-sha1 = "8f5fa7056e6dcfb23ac5211de38e6c03f6367794"
uuid = "0ff47ea0-7a50-410d-8455-4348d5de0420"
version = "0.1.6"

[[deps.PlutoTeachingTools]]
deps = ["Downloads", "HypertextLiteral", "LaTeXStrings", "Latexify", "Markdown", "PlutoLinks", "PlutoUI", "Random"]
git-tree-sha1 = "eb11c2e0586fdf48d5d262ba6e29e438ccc512d9"
uuid = "661c6b06-c737-4d37-b85c-46df65de6f69"
version = "0.2.6"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "5bb5129fdd62a2bbbe17c2756932259acf467386"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.50"

[[deps.PoissonRandom]]
deps = ["Random"]
git-tree-sha1 = "45f9da1ceee5078267eb273d065e8aa2f2515790"
uuid = "e409e4f3-bfea-5376-8464-e040bb5c01ab"
version = "0.4.3"

[[deps.Polyester]]
deps = ["ArrayInterface", "BitTwiddlingConvenienceFunctions", "CPUSummary", "IfElse", "ManualMemory", "PolyesterWeave", "Requires", "Static", "StaticArrayInterface", "StrideArraysCore", "ThreadingUtilities"]
git-tree-sha1 = "0fe4e7c4d8ff4c70bfa507f0dd96fa161b115777"
uuid = "f517fe37-dbe3-4b94-8317-1923a5111588"
version = "0.7.3"

[[deps.PolyesterWeave]]
deps = ["BitTwiddlingConvenienceFunctions", "CPUSummary", "IfElse", "Static", "ThreadingUtilities"]
git-tree-sha1 = "240d7170f5ffdb285f9427b92333c3463bf65bf6"
uuid = "1d0040c9-8b98-4ee7-8388-3f51789ca0ad"
version = "0.2.1"

[[deps.PooledArrays]]
deps = ["DataAPI", "Future"]
git-tree-sha1 = "a6062fe4063cdafe78f4a0a81cfffb89721b30e7"
uuid = "2dfb63ee-cc39-5dd5-95bd-886bf059d720"
version = "1.4.2"

[[deps.PositiveFactorizations]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "17275485f373e6673f7e7f97051f703ed5b15b20"
uuid = "85a6dd25-e78a-55b7-8502-1745935b8125"
version = "0.2.4"

[[deps.PreallocationTools]]
deps = ["Adapt", "ArrayInterface", "ForwardDiff", "Requires"]
git-tree-sha1 = "f739b1b3cc7b9949af3b35089931f2b58c289163"
uuid = "d236fae5-4411-538c-8e31-a6e3d9e00b46"
version = "0.4.12"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "47e5f437cc0e7ef2ce8406ce1e7e24d44915f88d"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.3.0"

[[deps.PrettyTables]]
deps = ["Crayons", "Formatting", "LaTeXStrings", "Markdown", "Reexport", "StringManipulation", "Tables"]
git-tree-sha1 = "96f6db03ab535bdb901300f88335257b0018689d"
uuid = "08abe8d2-0d0c-5749-adfa-8a2ac140af0d"
version = "2.2.2"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.Qt5Base_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Fontconfig_jll", "Glib_jll", "JLLWrappers", "Libdl", "Libglvnd_jll", "OpenSSL_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libxcb_jll", "Xorg_xcb_util_image_jll", "Xorg_xcb_util_keysyms_jll", "Xorg_xcb_util_renderutil_jll", "Xorg_xcb_util_wm_jll", "Zlib_jll", "xkbcommon_jll"]
git-tree-sha1 = "0c03844e2231e12fda4d0086fd7cbe4098ee8dc5"
uuid = "ea2cea3b-5b76-57ae-a6ef-0a8af62496e1"
version = "5.15.3+2"

[[deps.QuadGK]]
deps = ["DataStructures", "LinearAlgebra"]
git-tree-sha1 = "786efa36b7eff813723c4849c90456609cf06661"
uuid = "1fd47b50-473d-5c70-9696-f719f8f3bcdc"
version = "2.8.1"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Random123]]
deps = ["Random", "RandomNumbers"]
git-tree-sha1 = "7a1a306b72cfa60634f03a911405f4e64d1b718b"
uuid = "74087812-796a-5b5d-8853-05524746bad3"
version = "1.6.0"

[[deps.RandomNumbers]]
deps = ["Random", "Requires"]
git-tree-sha1 = "043da614cc7e95c703498a491e2c21f58a2b8111"
uuid = "e6cf234a-135c-5ec9-84dd-332b85af5143"
version = "1.5.3"

[[deps.RecipesBase]]
deps = ["SnoopPrecompile"]
git-tree-sha1 = "261dddd3b862bd2c940cf6ca4d1c8fe593e457c8"
uuid = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
version = "1.3.3"

[[deps.RecipesPipeline]]
deps = ["Dates", "NaNMath", "PlotUtils", "RecipesBase", "SnoopPrecompile"]
git-tree-sha1 = "e974477be88cb5e3040009f3767611bc6357846f"
uuid = "01d81517-befc-4cb6-b9ec-a95719d0359c"
version = "0.6.11"

[[deps.RecursiveArrayTools]]
deps = ["Adapt", "ArrayInterface", "ChainRulesCore", "DocStringExtensions", "FillArrays", "GPUArraysCore", "IteratorInterfaceExtensions", "LinearAlgebra", "RecipesBase", "Requires", "StaticArraysCore", "Statistics", "SymbolicIndexingInterface", "Tables", "ZygoteRules"]
git-tree-sha1 = "3dcb2a98436389c0aac964428a5fa099118944de"
uuid = "731186ca-8d62-57ce-b412-fbd966d074cd"
version = "2.38.0"

[[deps.RecursiveFactorization]]
deps = ["LinearAlgebra", "LoopVectorization", "Polyester", "SnoopPrecompile", "StrideArraysCore", "TriangularSolve"]
git-tree-sha1 = "9088515ad915c99026beb5436d0a09cd8c18163e"
uuid = "f2c3362d-daeb-58d1-803e-2bc74f2840b4"
version = "0.2.18"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.RelocatableFolders]]
deps = ["SHA", "Scratch"]
git-tree-sha1 = "90bc7a7c96410424509e4263e277e43250c05691"
uuid = "05181044-ff0b-4ac5-8273-598c1e38db00"
version = "1.0.0"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[deps.ResettableStacks]]
deps = ["StaticArrays"]
git-tree-sha1 = "256eeeec186fa7f26f2801732774ccf277f05db9"
uuid = "ae5879a3-cd67-5da8-be7f-38c6eb64a37b"
version = "1.1.1"

[[deps.Revise]]
deps = ["CodeTracking", "Distributed", "FileWatching", "JuliaInterpreter", "LibGit2", "LoweredCodeUtils", "OrderedCollections", "Pkg", "REPL", "Requires", "UUIDs", "Unicode"]
git-tree-sha1 = "90cb983381a9dc7d3dff5fb2d1ee52cd59877412"
uuid = "295af30f-e4ad-537b-8983-00126c2a3abe"
version = "3.5.1"

[[deps.Rmath]]
deps = ["Random", "Rmath_jll"]
git-tree-sha1 = "f65dcb5fa46aee0cf9ed6274ccbd597adc49aa7b"
uuid = "79098fc4-a85e-5d69-aa6a-4863f24498fa"
version = "0.7.1"

[[deps.Rmath_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "6ed52fdd3382cf21947b15e8870ac0ddbff736da"
uuid = "f50d1b31-88e8-58de-be2c-1cc44531875f"
version = "0.4.0+0"

[[deps.RuntimeGeneratedFunctions]]
deps = ["ExprTools", "SHA", "Serialization"]
git-tree-sha1 = "50314d2ef65fce648975a8e80ae6d8409ebbf835"
uuid = "7e49a35a-f44a-4d26-94aa-eba1b4ca6b47"
version = "0.5.5"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.SIMDTypes]]
git-tree-sha1 = "330289636fb8107c5f32088d2741e9fd7a061a5c"
uuid = "94e857df-77ce-4151-89e5-788b33177be4"
version = "0.1.0"

[[deps.SLEEFPirates]]
deps = ["IfElse", "Static", "VectorizationBase"]
git-tree-sha1 = "cda0aece8080e992f6370491b08ef3909d1c04e7"
uuid = "476501e8-09a2-5ece-8869-fb82de89a1fa"
version = "0.6.38"

[[deps.SciMLBase]]
deps = ["ArrayInterface", "CommonSolve", "ConstructionBase", "Distributed", "DocStringExtensions", "EnumX", "FunctionWrappersWrappers", "IteratorInterfaceExtensions", "LinearAlgebra", "Logging", "Markdown", "Preferences", "RecipesBase", "RecursiveArrayTools", "Reexport", "RuntimeGeneratedFunctions", "SciMLOperators", "SnoopPrecompile", "StaticArraysCore", "Statistics", "SymbolicIndexingInterface", "Tables", "TruncatedStacktraces"]
git-tree-sha1 = "fe55d9f9d73fec26f64881ba8d120607c22a54b0"
uuid = "0bca4576-84f4-4d90-8ffe-ffa030f20462"
version = "1.88.0"

[[deps.SciMLNLSolve]]
deps = ["DiffEqBase", "LineSearches", "NLsolve", "Reexport", "SciMLBase"]
git-tree-sha1 = "66c7f901dbcad51791136e2d90ee67240256ecde"
uuid = "e9a6253c-8580-4d32-9898-8661bb511710"
version = "0.1.3"

[[deps.SciMLOperators]]
deps = ["ArrayInterface", "DocStringExtensions", "Lazy", "LinearAlgebra", "Setfield", "SparseArrays", "StaticArraysCore", "Tricks"]
git-tree-sha1 = "8419114acbba861ac49e1ab2750bae5c5eda35c4"
uuid = "c0aeaf25-5076-4817-a8d5-81caf7dfa961"
version = "0.1.22"

[[deps.Scratch]]
deps = ["Dates"]
git-tree-sha1 = "f94f779c94e58bf9ea243e77a37e16d9de9126bd"
uuid = "6c6a2e73-6563-6170-7368-637461726353"
version = "1.1.1"

[[deps.SentinelArrays]]
deps = ["Dates", "Random"]
git-tree-sha1 = "77d3c4726515dca71f6d80fbb5e251088defe305"
uuid = "91c51154-3ec4-41a3-a24f-3f23e20d615c"
version = "1.3.18"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.Setfield]]
deps = ["ConstructionBase", "Future", "MacroTools", "StaticArraysCore"]
git-tree-sha1 = "e2cc6d8c88613c05e1defb55170bf5ff211fbeac"
uuid = "efcf1570-3423-57d1-acb7-fd33fddbac46"
version = "1.1.1"

[[deps.SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

[[deps.ShortCodes]]
deps = ["Base64", "CodecZlib", "HTTP", "JSON3", "Memoize", "UUIDs"]
git-tree-sha1 = "ac4f9037fd6f0cd51948dba5eee2c508116f7f41"
uuid = "f62ebe17-55c5-4640-972f-b59c0dd11ccf"
version = "0.3.4"

[[deps.Showoff]]
deps = ["Dates", "Grisu"]
git-tree-sha1 = "91eddf657aca81df9ae6ceb20b959ae5653ad1de"
uuid = "992d4aef-0814-514b-bc4d-f2e9a6c4116f"
version = "1.0.3"

[[deps.SimpleBufferStream]]
git-tree-sha1 = "874e8867b33a00e784c8a7e4b60afe9e037b74e1"
uuid = "777ac1f9-54b0-4bf8-805c-2214025038e7"
version = "1.1.0"

[[deps.SimpleNonlinearSolve]]
deps = ["ArrayInterface", "DiffEqBase", "FiniteDiff", "ForwardDiff", "LinearAlgebra", "Reexport", "Requires", "SciMLBase", "SnoopPrecompile", "StaticArraysCore"]
git-tree-sha1 = "326789bbaa1b65b809bd4596b74e4fc3be5af6ac"
uuid = "727e6d20-b764-4bd8-a329-72de5adea6c7"
version = "0.1.13"

[[deps.SimpleTraits]]
deps = ["InteractiveUtils", "MacroTools"]
git-tree-sha1 = "5d7e3f4e11935503d3ecaf7186eac40602e7d231"
uuid = "699a6c99-e7fa-54fc-8d76-47d257e15c1d"
version = "0.9.4"

[[deps.SnoopPrecompile]]
deps = ["Preferences"]
git-tree-sha1 = "e760a70afdcd461cf01a575947738d359234665c"
uuid = "66db9d55-30c0-4569-8b51-7e840670fc0c"
version = "1.0.3"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "a4ada03f999bd01b3a25dcaa30b2d929fe537e00"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.1.0"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.SparseDiffTools]]
deps = ["Adapt", "ArrayInterface", "Compat", "DataStructures", "FiniteDiff", "ForwardDiff", "Graphs", "LinearAlgebra", "Requires", "SparseArrays", "StaticArrays", "VertexSafeGraphs"]
git-tree-sha1 = "e19ac47477c9a8fcca06dab5e5471417d5d9d723"
uuid = "47a9eef4-7e08-11e9-0b38-333d64bd3804"
version = "1.31.0"

[[deps.Sparspak]]
deps = ["Libdl", "LinearAlgebra", "Logging", "OffsetArrays", "Printf", "SparseArrays", "Test"]
git-tree-sha1 = "342cf4b449c299d8d1ceaf00b7a49f4fbc7940e7"
uuid = "e56a9233-b9d6-4f03-8d0f-1825330902ac"
version = "0.3.9"

[[deps.SpecialFunctions]]
deps = ["ChainRulesCore", "IrrationalConstants", "LogExpFunctions", "OpenLibm_jll", "OpenSpecFun_jll"]
git-tree-sha1 = "ef28127915f4229c971eb43f3fc075dd3fe91880"
uuid = "276daf66-3868-5448-9aa4-cd146d93841b"
version = "2.2.0"

[[deps.Static]]
deps = ["IfElse"]
git-tree-sha1 = "d0435ba43ab5ad1cbb5f0d286ca4ba67029ed3ee"
uuid = "aedffcd0-7271-4cad-89d0-dc628f76c6d3"
version = "0.8.4"

[[deps.StaticArrayInterface]]
deps = ["ArrayInterface", "Compat", "IfElse", "LinearAlgebra", "Requires", "SnoopPrecompile", "SparseArrays", "Static", "SuiteSparse"]
git-tree-sha1 = "5589ab073f8a244d2530b36478f53806f9106002"
uuid = "0d7ed370-da01-4f52-bd93-41d350b8b718"
version = "1.2.1"

[[deps.StaticArrays]]
deps = ["LinearAlgebra", "Random", "StaticArraysCore", "Statistics"]
git-tree-sha1 = "2d7d9e1ddadc8407ffd460e24218e37ef52dd9a3"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.5.16"

[[deps.StaticArraysCore]]
git-tree-sha1 = "6b7ba252635a5eff6a0b0664a41ee140a1c9e72a"
uuid = "1e83bf80-4336-4d27-bf5d-d5a4f845583c"
version = "1.4.0"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.StatsAPI]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "f9af7f195fb13589dd2e2d57fdb401717d2eb1f6"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.5.0"

[[deps.StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "LogExpFunctions", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "d1bf48bfcc554a3761a133fe3a9bb01488e06916"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.33.21"

[[deps.StatsFuns]]
deps = ["ChainRulesCore", "HypergeometricFunctions", "InverseFunctions", "IrrationalConstants", "LogExpFunctions", "Reexport", "Rmath", "SpecialFunctions"]
git-tree-sha1 = "f625d686d5a88bcd2b15cd81f18f98186fdc0c9a"
uuid = "4c63d2b9-4356-54db-8cca-17b64c39e42c"
version = "1.3.0"

[[deps.SteadyStateDiffEq]]
deps = ["DiffEqBase", "DiffEqCallbacks", "LinearAlgebra", "NLsolve", "Reexport", "SciMLBase"]
git-tree-sha1 = "8998e426c1d49ef92d4c60cc81acb90ddf92c610"
uuid = "9672c7b4-1e72-59bd-8a11-6ac3964bc41f"
version = "1.13.0"

[[deps.StochasticDiffEq]]
deps = ["Adapt", "ArrayInterface", "DataStructures", "DiffEqBase", "DiffEqNoiseProcess", "DocStringExtensions", "FillArrays", "FiniteDiff", "ForwardDiff", "JumpProcesses", "LevyArea", "LinearAlgebra", "Logging", "MuladdMacro", "NLsolve", "OrdinaryDiffEq", "Random", "RandomNumbers", "RecursiveArrayTools", "Reexport", "SciMLBase", "SparseArrays", "SparseDiffTools", "StaticArrays", "UnPack"]
git-tree-sha1 = "c6b4b802d4d830e0e958f5f2098d8dea0a935f4b"
uuid = "789caeaf-c7a9-5a7d-9973-96adeb23e2a0"
version = "6.58.0"

[[deps.StrideArraysCore]]
deps = ["ArrayInterface", "CloseOpenIntervals", "IfElse", "LayoutPointers", "ManualMemory", "SIMDTypes", "Static", "StaticArrayInterface", "ThreadingUtilities"]
git-tree-sha1 = "2842f1dbd12d59f2728ba79f4002cd6b61808f8b"
uuid = "7792a7ef-975c-4747-a70f-980b88e8d1da"
version = "0.4.8"

[[deps.StringManipulation]]
git-tree-sha1 = "46da2434b41f41ac3594ee9816ce5541c6096123"
uuid = "892a3eda-7b42-436c-8928-eab12a02cf0e"
version = "0.3.0"

[[deps.StructTypes]]
deps = ["Dates", "UUIDs"]
git-tree-sha1 = "ca4bccb03acf9faaf4137a9abc1881ed1841aa70"
uuid = "856f2bd8-1eba-4b0a-8007-ebc267875bd4"
version = "1.10.0"

[[deps.SuiteSparse]]
deps = ["Libdl", "LinearAlgebra", "Serialization", "SparseArrays"]
uuid = "4607b0f0-06f3-5cda-b6b1-a6196a1729e9"

[[deps.SuiteSparse_jll]]
deps = ["Artifacts", "Libdl", "Pkg", "libblastrampoline_jll"]
uuid = "bea87d4a-7f5b-5778-9afe-8cc45184846c"
version = "5.10.1+0"

[[deps.Sundials]]
deps = ["CEnum", "DataStructures", "DiffEqBase", "Libdl", "LinearAlgebra", "Logging", "Reexport", "SciMLBase", "SnoopPrecompile", "SparseArrays", "Sundials_jll"]
git-tree-sha1 = "c033830e3c6fb4260243fc907b1e7e93421e7ae8"
uuid = "c3572dad-4567-51f8-b174-8c6c989267f4"
version = "4.15.1"

[[deps.Sundials_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "OpenBLAS_jll", "Pkg", "SuiteSparse_jll"]
git-tree-sha1 = "04777432d74ec5bc91ca047c9e0e0fd7f81acdb6"
uuid = "fb77eaff-e24c-56d4-86b1-d163f2edb164"
version = "5.2.1+0"

[[deps.SymbolicIndexingInterface]]
deps = ["DocStringExtensions"]
git-tree-sha1 = "f8ab052bfcbdb9b48fad2c80c873aa0d0344dfe5"
uuid = "2efcf032-c050-4f8e-a9bb-153293bab1f5"
version = "0.2.2"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.0"

[[deps.TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[deps.Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "LinearAlgebra", "OrderedCollections", "TableTraits", "Test"]
git-tree-sha1 = "c79322d36826aa2f4fd8ecfa96ddb47b174ac78d"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.10.0"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.1"

[[deps.TensorCore]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "1feb45f88d133a655e001435632f019a9a1bcdb6"
uuid = "62fd8b95-f654-4bbd-a8a5-9c27f68ccd50"
version = "0.1.1"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.ThreadingUtilities]]
deps = ["ManualMemory"]
git-tree-sha1 = "c97f60dd4f2331e1a495527f80d242501d2f9865"
uuid = "8290d209-cae3-49c0-8002-c8c24d57dab5"
version = "0.5.1"

[[deps.TranscodingStreams]]
deps = ["Random", "Test"]
git-tree-sha1 = "94f38103c984f89cf77c402f2a68dbd870f8165f"
uuid = "3bb67fe8-82b1-5028-8e26-92a6c54297fa"
version = "0.9.11"

[[deps.TreeViews]]
deps = ["Test"]
git-tree-sha1 = "8d0d7a3fe2f30d6a7f833a5f19f7c7a5b396eae6"
uuid = "a2a6695c-b41b-5b7d-aed9-dbfdeacea5d7"
version = "0.3.0"

[[deps.TriangularSolve]]
deps = ["CloseOpenIntervals", "IfElse", "LayoutPointers", "LinearAlgebra", "LoopVectorization", "Polyester", "Static", "VectorizationBase"]
git-tree-sha1 = "31eedbc0b6d07c08a700e26d31298ac27ef330eb"
uuid = "d5829a12-d9aa-46ab-831f-fb7c9ab06edf"
version = "0.1.19"

[[deps.Tricks]]
git-tree-sha1 = "6bac775f2d42a611cdfcd1fb217ee719630c4175"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.6"

[[deps.TruncatedStacktraces]]
deps = ["InteractiveUtils"]
git-tree-sha1 = "7cdbe45f0018b7f681a6b63ad1250ee6f2297a87"
uuid = "781d530d-4396-4725-bb49-402e4bee1e77"
version = "1.0.0"

[[deps.URIs]]
git-tree-sha1 = "074f993b0ca030848b897beff716d93aca60f06a"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.4.2"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.UnPack]]
git-tree-sha1 = "387c1f73762231e86e0c9c5443ce3b4a0a9a0c2b"
uuid = "3a884ed6-31ef-47d7-9d2a-63182c4928ed"
version = "1.0.2"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.UnicodeFun]]
deps = ["REPL"]
git-tree-sha1 = "53915e50200959667e78a92a418594b428dffddf"
uuid = "1cfade01-22cf-5700-b092-accc4b62d6e1"
version = "0.4.1"

[[deps.Unzip]]
git-tree-sha1 = "ca0969166a028236229f63514992fc073799bb78"
uuid = "41fe7b60-77ed-43a1-b4f0-825fd5a5650d"
version = "0.2.0"

[[deps.VectorizationBase]]
deps = ["ArrayInterface", "CPUSummary", "HostCPUFeatures", "IfElse", "LayoutPointers", "Libdl", "LinearAlgebra", "SIMDTypes", "Static", "StaticArrayInterface"]
git-tree-sha1 = "952ba509a61d1ebb26381ac459c5c6e838ed43c4"
uuid = "3d5dd08c-fd9d-11e8-17fa-ed2836048c2f"
version = "0.21.60"

[[deps.VertexSafeGraphs]]
deps = ["Graphs"]
git-tree-sha1 = "8351f8d73d7e880bfc042a8b6922684ebeafb35c"
uuid = "19fa3120-7c27-5ec5-8db8-b0b0aa330d6f"
version = "0.2.0"

[[deps.Wayland_jll]]
deps = ["Artifacts", "Expat_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "ed8d92d9774b077c53e1da50fd81a36af3744c1c"
uuid = "a2964d1f-97da-50d4-b82a-358c7fce9d89"
version = "1.21.0+0"

[[deps.Wayland_protocols_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4528479aa01ee1b3b4cd0e6faef0e04cf16466da"
uuid = "2381bf8a-dfd0-557d-9999-79630e7b1b91"
version = "1.25.0+0"

[[deps.WeakRefStrings]]
deps = ["DataAPI", "InlineStrings", "Parsers"]
git-tree-sha1 = "b1be2855ed9ed8eac54e5caff2afcdb442d52c23"
uuid = "ea10d353-3f73-51f8-a26c-33c1cb351aa5"
version = "1.4.2"

[[deps.WorkerUtilities]]
git-tree-sha1 = "cd1659ba0d57b71a464a29e64dbc67cfe83d54e7"
uuid = "76eceee3-57b5-4d4a-8e66-0e911cebbf60"
version = "1.6.1"

[[deps.XML2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "93c41695bc1c08c46c5899f4fe06d6ead504bb73"
uuid = "02c8fc9c-b97f-50b9-bbe4-9be30ff0a78a"
version = "2.10.3+0"

[[deps.XSLT_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgcrypt_jll", "Libgpg_error_jll", "Libiconv_jll", "Pkg", "XML2_jll", "Zlib_jll"]
git-tree-sha1 = "91844873c4085240b95e795f692c4cec4d805f8a"
uuid = "aed1982a-8fda-507f-9586-7b0439959a61"
version = "1.1.34+0"

[[deps.Xorg_libX11_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll", "Xorg_xtrans_jll"]
git-tree-sha1 = "5be649d550f3f4b95308bf0183b82e2582876527"
uuid = "4f6342f7-b3d2-589e-9d20-edeb45f2b2bc"
version = "1.6.9+4"

[[deps.Xorg_libXau_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4e490d5c960c314f33885790ed410ff3a94ce67e"
uuid = "0c0b7dd1-d40b-584c-a123-a41640f87eec"
version = "1.0.9+4"

[[deps.Xorg_libXcursor_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXfixes_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "12e0eb3bc634fa2080c1c37fccf56f7c22989afd"
uuid = "935fb764-8cf2-53bf-bb30-45bb1f8bf724"
version = "1.2.0+4"

[[deps.Xorg_libXdmcp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4fe47bd2247248125c428978740e18a681372dd4"
uuid = "a3789734-cfe1-5b06-b2d0-1dd0d9d62d05"
version = "1.1.3+4"

[[deps.Xorg_libXext_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "b7c0aa8c376b31e4852b360222848637f481f8c3"
uuid = "1082639a-0dae-5f34-9b06-72781eeb8cb3"
version = "1.3.4+4"

[[deps.Xorg_libXfixes_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "0e0dc7431e7a0587559f9294aeec269471c991a4"
uuid = "d091e8ba-531a-589c-9de9-94069b037ed8"
version = "5.0.3+4"

[[deps.Xorg_libXi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXfixes_jll"]
git-tree-sha1 = "89b52bc2160aadc84d707093930ef0bffa641246"
uuid = "a51aa0fd-4e3c-5386-b890-e753decda492"
version = "1.7.10+4"

[[deps.Xorg_libXinerama_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll"]
git-tree-sha1 = "26be8b1c342929259317d8b9f7b53bf2bb73b123"
uuid = "d1454406-59df-5ea1-beac-c340f2130bc3"
version = "1.1.4+4"

[[deps.Xorg_libXrandr_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "34cea83cb726fb58f325887bf0612c6b3fb17631"
uuid = "ec84b674-ba8e-5d96-8ba1-2a689ba10484"
version = "1.5.2+4"

[[deps.Xorg_libXrender_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "19560f30fd49f4d4efbe7002a1037f8c43d43b96"
uuid = "ea2f1a96-1ddc-540d-b46f-429655e07cfa"
version = "0.9.10+4"

[[deps.Xorg_libpthread_stubs_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "6783737e45d3c59a4a4c4091f5f88cdcf0908cbb"
uuid = "14d82f49-176c-5ed1-bb49-ad3f5cbd8c74"
version = "0.1.0+3"

[[deps.Xorg_libxcb_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "XSLT_jll", "Xorg_libXau_jll", "Xorg_libXdmcp_jll", "Xorg_libpthread_stubs_jll"]
git-tree-sha1 = "daf17f441228e7a3833846cd048892861cff16d6"
uuid = "c7cfdc94-dc32-55de-ac96-5a1b8d977c5b"
version = "1.13.0+3"

[[deps.Xorg_libxkbfile_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "926af861744212db0eb001d9e40b5d16292080b2"
uuid = "cc61e674-0454-545c-8b26-ed2c68acab7a"
version = "1.1.0+4"

[[deps.Xorg_xcb_util_image_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "0fab0a40349ba1cba2c1da699243396ff8e94b97"
uuid = "12413925-8142-5f55-bb0e-6d7ca50bb09b"
version = "0.4.0+1"

[[deps.Xorg_xcb_util_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll"]
git-tree-sha1 = "e7fd7b2881fa2eaa72717420894d3938177862d1"
uuid = "2def613f-5ad1-5310-b15b-b15d46f528f5"
version = "0.4.0+1"

[[deps.Xorg_xcb_util_keysyms_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "d1151e2c45a544f32441a567d1690e701ec89b00"
uuid = "975044d2-76e6-5fbe-bf08-97ce7c6574c7"
version = "0.4.0+1"

[[deps.Xorg_xcb_util_renderutil_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "dfd7a8f38d4613b6a575253b3174dd991ca6183e"
uuid = "0d47668e-0667-5a69-a72c-f761630bfb7e"
version = "0.3.9+1"

[[deps.Xorg_xcb_util_wm_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "e78d10aab01a4a154142c5006ed44fd9e8e31b67"
uuid = "c22f9ab0-d5fe-5066-847c-f4bb1cd4e361"
version = "0.4.1+1"

[[deps.Xorg_xkbcomp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxkbfile_jll"]
git-tree-sha1 = "4bcbf660f6c2e714f87e960a171b119d06ee163b"
uuid = "35661453-b289-5fab-8a00-3d9160c6a3a4"
version = "1.4.2+4"

[[deps.Xorg_xkeyboard_config_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xkbcomp_jll"]
git-tree-sha1 = "5c8424f8a67c3f2209646d4425f3d415fee5931d"
uuid = "33bec58e-1273-512f-9401-5d533626f822"
version = "2.27.0+4"

[[deps.Xorg_xtrans_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "79c31e7844f6ecf779705fbc12146eb190b7d845"
uuid = "c5fb5394-a638-5e4d-96e5-b29de1b5cf10"
version = "1.4.0+3"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.12+3"

[[deps.Zstd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "c6edfe154ad7b313c01aceca188c05c835c67360"
uuid = "3161d3a3-bdf6-5164-811a-617609db77b4"
version = "1.5.4+0"

[[deps.ZygoteRules]]
deps = ["MacroTools"]
git-tree-sha1 = "8c1a8e4dfacb1fd631745552c8db35d0deb09ea0"
uuid = "700de1a5-db45-46bc-99cf-38207098b444"
version = "0.2.2"

[[deps.fzf_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "868e669ccb12ba16eaf50cb2957ee2ff61261c56"
uuid = "214eeab7-80f7-51ab-84ad-2988db7cef09"
version = "0.29.0+0"

[[deps.libaom_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "3a2ea60308f0996d26f1e5354e10c24e9ef905d4"
uuid = "a4ae2306-e953-59d6-aa16-d00cac43593b"
version = "3.4.0+0"

[[deps.libass_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "HarfBuzz_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "5982a94fcba20f02f42ace44b9894ee2b140fe47"
uuid = "0ac62f75-1d6f-5e53-bd7c-93b484bb37c0"
version = "0.15.1+0"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.1.1+0"

[[deps.libfdk_aac_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "daacc84a041563f965be61859a36e17c4e4fcd55"
uuid = "f638f0a6-7fb0-5443-88ba-1cc74229b280"
version = "2.0.2+0"

[[deps.libpng_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "94d180a6d2b5e55e447e2d27a29ed04fe79eb30c"
uuid = "b53b4c65-9356-5827-b1ea-8c7a1a84506f"
version = "1.6.38+0"

[[deps.libvorbis_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Ogg_jll", "Pkg"]
git-tree-sha1 = "b910cb81ef3fe6e78bf6acee440bda86fd6ae00c"
uuid = "f27f6e37-5d2b-51aa-960f-b287f2bc3b7a"
version = "1.3.7+1"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.48.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+0"

[[deps.x264_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4fea590b89e6ec504593146bf8b988b2c00922b2"
uuid = "1270edf5-f2f9-52d2-97e9-ab00b5d0237a"
version = "2021.5.5+0"

[[deps.x265_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "ee567a171cce03570d77ad3a43e90218e38937a9"
uuid = "dfaa095f-4041-5dcd-9319-2fabd8486b76"
version = "3.5.0+0"

[[deps.xkbcommon_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Wayland_jll", "Wayland_protocols_jll", "Xorg_libxcb_jll", "Xorg_xkeyboard_config_jll"]
git-tree-sha1 = "9ebfc140cc56e8c2156a15ceac2f0302e327ac0a"
uuid = "d8fb68d0-12a3-5cfd-a85a-d49703b185fd"
version = "1.4.1+0"
"""

# ╔═╡ Cell order:
# ╟─e58400d8-e6d8-4293-86f3-e71e3326db68
# ╟─3090cc16-913e-46ac-9fd8-a167a869baf3
# ╟─f2f363f7-7755-4d5d-8112-5ddd20bb5278
# ╟─1d751412-66a2-4165-b6b9-343560203fa4
# ╟─d70c1e41-e3ba-42f4-ac13-a0c9071882b6
# ╟─657a8e78-0781-41af-b421-824925f1fec1
# ╟─b93be387-bcdf-4d81-ad7d-173b4b62cad9
# ╟─f0144fbc-4732-414b-a6ca-6e7b172a0e68
# ╟─ad3eddd5-5ded-41f2-819d-14d28265df3c
# ╟─e47cff1d-429d-448c-a66a-2a95d5b86975
# ╟─456a7520-13b3-4bea-a121-b499612d4e65
# ╟─a25c910d-6b31-4359-8a80-8fc56cdc6cd3
# ╟─0c82bab4-6145-49eb-8140-b18d4b488b7e
# ╟─106d22f6-df56-44c1-9eab-9af1ba1c2b5f
# ╟─e8d9e8e3-6ff2-4c27-a149-d44b94e5430c
# ╟─d67fa2c0-ec8b-4294-a26b-3d57311faf67
# ╟─2181d8f8-8a61-47bc-97d8-3747c4c824dc
# ╟─28a79ac0-ee6a-46d6-aed6-80842990cdd4
# ╟─93d0f231-077f-439c-84b1-e6408272fab2
# ╟─8fad238e-5ebc-4f92-95e7-09b6f6b2ec48
# ╟─fb8f4d3f-6480-4599-a311-f534cd134fff
# ╟─e0dac55f-70a2-4035-822f-8f26c6d2106d
# ╟─25422eb4-46da-4f81-8d65-03ad8913ec9d
# ╟─a1f8d1ba-26bc-4a37-a793-25b87101ec4c
# ╟─3fa02153-ac79-448e-8b35-39fad81abacb
# ╟─f4577e3f-5204-4e5c-879f-05907226225b
# ╟─eea251fa-8c1b-4d4e-ba39-4896461dc3f9
# ╟─38c749e0-f82c-431c-a31a-ca22846709bc
# ╟─0038fef7-4bd3-4b32-8509-b153e8a5a655
# ╠═1667cfcb-1c57-42f0-9e16-dc26829b58ca
# ╟─b20f4fb2-d31c-4442-b8be-219eb5d41cf0
# ╟─fedd0e5b-7d0a-48c7-92b5-66dd45a9051b
# ╟─f50caa50-8f79-498d-a60f-9f5509c99923
# ╟─e9d627f3-0466-472f-9e3e-dad738790bfb
# ╟─31062028-878c-410b-af15-1cd51496c2aa
# ╟─55520238-9960-4705-b3c4-dfb32544aaf7
# ╟─361e618a-bcb4-41c5-9476-bd737434a197
# ╟─78294055-989f-4094-a78d-643b0554781d
# ╟─5ea8dcc5-712b-442a-bbe7-f20700b7a813
# ╟─4956acb8-ba62-4975-9577-23428647674a
# ╟─b595ea3e-4718-4b11-a1b1-18fcf21840e2
# ╟─058e0701-7fe4-457c-a0f4-578d8fab7d01
# ╟─20dd95cc-c67d-4c6c-ad67-d421c058945f
# ╟─5fdad0a6-be84-4e6e-a3a4-dde625ea8ac5
# ╟─2c2bd5f6-2850-4f65-946e-fd6f7da0c3f2
# ╟─d7fcead1-ed6f-4bf7-872f-560bc3d2a389
# ╟─406d442d-e205-4ae5-b109-3122e341d5b6
# ╟─9169bbcc-b02d-4ed1-9582-d739a8a6a7ed
# ╟─c4b31e49-b2f9-4c91-9cbd-613952faa618
# ╟─8437a02a-6a6b-47d0-a688-c91d40bc366b
# ╟─0aa1f79d-d610-43d1-989b-8a38499cd61c
# ╟─46355813-921b-49a5-b280-12e8e3dbcf13
# ╟─948a0225-036e-4861-ad83-54e5005ee15e
# ╠═43e71015-485a-434d-a46b-bfc97677501b
# ╟─493195d1-4a1f-436c-ad3f-f02f0d41605e
# ╠═ffd12e6f-36d3-4bde-be44-44080e79dc54
# ╟─ab3b7a43-2b62-4672-afd3-3183230b1d51
# ╟─fdd6d5b5-4907-4ed8-9a86-191ec9014189
# ╟─fd1f811f-ba33-4087-ad42-f1a93ebad1ca
# ╠═1bc57f89-ac95-4c14-95fd-87e66a23e314
# ╠═c50f7a49-c029-4f9c-b96b-1d2b49b48bc4
# ╟─2d82156f-2383-4e11-bd25-f206e28b1465
# ╟─de12117a-fc0d-4a4a-a2ed-4f9fc19867cf
# ╟─af169021-d62e-4b37-85ed-23aa98d80beb
# ╠═b64d90c3-6797-41df-8ae7-77f1e70fa436
# ╟─c6b0351e-1e79-4f88-b171-5d3f776a7709
# ╟─6fe6666b-622e-4e1f-8bcd-254fcb264bb0
# ╟─7db9d8fb-55cd-429d-b62e-bbadb1b54d25
# ╟─372f6169-2c73-4652-b767-80952b74ec0f
# ╟─dababbc3-b8f5-42fb-86b1-ae51bba83bc9
# ╟─305710a5-aba1-470b-b47b-281c9391952c
# ╠═33812516-1ad5-49af-a82c-65bc9897908b
# ╟─2840ec61-24bb-473e-a47e-e6665b4789d1
# ╠═e7a5458c-e091-4fbc-80d6-278462a64805
# ╟─798d013e-2eb7-4f57-b7a8-064533e81952
# ╟─9f3f1ed6-8ce0-45d2-9e3b-53c959acb209
# ╟─e8b2e939-f875-403c-9747-f496a7a00f22
# ╠═40da337a-6071-43bb-9450-8d67e0f18802
# ╠═8e6def94-39b2-457a-b7fc-7e19671fea1a
# ╠═b18f5942-f941-4a23-96a8-013de739ab10
# ╠═24a443bf-73c9-4aec-b40e-c7e0a054b2b6
# ╟─e481f231-c4e9-477d-aab0-a72ee184f8c9
# ╠═ac19840d-e7f0-479c-97e6-99177e68e837
# ╠═00129a4a-1c92-4b8e-ac99-c1ac626573b8
# ╟─28cdea50-4fa5-4ea1-8ca3-178dacaa1e73
# ╟─6399dfdb-0696-4ce3-a6b2-f1386a564d90
# ╟─5a5d0860-07a6-4830-8ac8-f2eea4bbe246
# ╠═de27709d-0a13-4ac7-9039-ca3bd28bbb40
# ╟─27f4e566-3d46-40df-b38e-93e7bb56dc41
# ╟─aa41fbf6-fbdd-49e4-8d98-6e507ca6681c
# ╠═8b53cc42-4f47-4542-ad02-339f20426cb9
# ╟─a1795d84-d2da-4429-a24e-1f4311a6545f
# ╟─398994bc-8d05-4a4e-8ebb-7f9eafe32245
# ╟─04933517-2d38-4327-9e43-3d5f10f0d247
# ╟─d2c21532-0ee6-4285-beeb-d3faa7c4b08c
# ╟─cbca2434-4db8-4171-84e4-5f32e0384c40
# ╠═c957c28e-5751-4379-929d-0db265b1804f
# ╠═982f0a56-7dda-4894-951e-e889264c3faa
# ╠═9bca7a02-a9e3-4c3b-be74-e710c084b65d
# ╟─2b34efbe-c604-499f-9daa-2ae454c657ac
# ╟─9b2df8f8-956c-4563-ba4a-380b9fa8dc1c
# ╟─4c6213fb-1d05-40d6-86ad-c7c2f756604a
# ╟─c9a5871d-de9d-4edb-b9f2-d3c74a62c17c
# ╟─4533ec3c-d8cd-4dc3-a668-2be70cc3d7f0
# ╟─e7707cc1-41b1-431c-93de-1166f4b5494d
# ╟─aa1c4b78-250c-44fc-9ba4-1d984b2f1070
# ╟─131ea3bd-a180-4e58-85f1-b817121d0ffc
# ╟─35cb54ea-5884-4088-bb59-7c222f9faa85
# ╟─3b7296ef-5b14-4b0c-baec-c0360914acb7
# ╟─f9b11713-14af-44ff-865f-105afb9630f7
# ╟─0a0a1c4e-17a7-4dca-9dce-643d05589e92
# ╟─6716af47-68a3-4ef8-8529-678c0f3ae398
# ╟─7a09d926-44bc-479b-b8ad-fa1023e053c2
# ╟─18a6c13f-9d10-4469-bdbb-5bd97e2e84b5
# ╟─0856cc67-62c4-43b5-8077-eb6536670f4c
# ╟─b8293210-5f47-430e-b0c7-347f21e36b34
# ╟─da0d4a35-a3f5-42b1-8364-46abc6e9674c
# ╟─d8c9b4d7-341b-4ed1-b493-7ffce0804484
# ╟─06f840e7-45ee-49e5-8fc5-25411d73d0cc
# ╟─b75e8550-fec6-4b1b-ab2a-ebfd7ce7d42c
# ╟─5224cd0e-3fbc-4584-b793-5e4cc3549595
# ╟─20bee7fd-0404-4f57-8e2b-df1ebb997c73
# ╟─65b0a3e8-b5c3-41f0-ba0c-c7501e8d46a0
# ╟─88703d39-3e5e-45e4-8470-d6bf2255abfc
# ╟─3d847e58-878a-47ef-b8e2-947905e07940
# ╟─1a17e04e-ed1e-4524-87c3-1b6fddf48706
# ╟─f93f61ba-f048-4c6a-9d08-6fbffb55dbac
# ╟─71c734b1-2a56-4981-9ed1-f8873926a8e9
# ╟─e8d66a16-e2e3-401f-bba0-634a6b19b07a
# ╟─fddbff2d-d746-47c9-9426-85f5a0be077e
# ╟─37610e11-3ce6-4da7-835a-8ee36e8cb12c
# ╟─3f1b72cd-89ad-4540-aee3-96dadac0a7eb
# ╟─5dca8e59-636c-4994-ab56-0eb8bce06fc6
# ╟─c151dd47-6465-47a6-b215-f26c5f025e30
# ╟─89362c55-b0be-4f02-a3cf-ce1f0c8742b6
# ╟─cf52512b-3f42-4fdf-8dc1-7991e3af0262
# ╟─0b474409-d0bd-470e-a1da-bdd93e6e9390
# ╟─18723d8d-0b36-46f0-bde2-62a46cd40cfe
# ╟─0e2d3599-a52f-4f61-b240-df8e8f42afa7
# ╟─6889a03e-ccb7-4ba6-a5bb-fdf9f6f08e49
# ╟─42c7fb46-5eb2-4935-b708-7eb537a18019
# ╟─33221bd6-6393-4ae7-a8f3-fd5ee4320da3
# ╟─661a1f69-676c-44b0-9004-5ad534125fd0
# ╟─e1dafd4b-250a-445c-a85b-31a931faf08e
# ╟─e746aadb-057c-40ba-8ee0-e2a1006eae75
# ╟─cd6e09dd-34e7-4071-acd8-d1359ffcc952
# ╟─2fd8141d-16ef-41fa-b778-36108bbdb767
# ╠═f2fa4e71-7d70-4d77-b03c-bba49b34b431
# ╠═18d471e7-c6d0-4073-8a31-beeb3a3f9c81
# ╟─fd3c9443-b61f-4741-a60d-d557e1c9f765
# ╟─151a53c9-f93d-4925-9c18-c0e21e9e2265
# ╟─0245aefb-25b0-4a02-a972-a0a8e121cf47
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
