### A Pluto.jl notebook ###
# v0.17.1

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

# ╔═╡ 52e498f6-1043-4326-9ad4-f2b55af4ba48
begin
	using PlutoUI # Pluto.jl user-interface
	using ShortCodes# for citations
	using DifferentialEquations, Plots, LinearAlgebra, CSV, DataFrames# for Simple Climate Model
end

# ╔═╡ d4029651-28e7-4197-9c5e-d192617458e3
html"<button onclick='present()'>present</button>"

# ╔═╡ 95d58f42-47c8-4709-a4a1-8a9b5e932dd9
md"""
# Introduction 
**to Supercapacitors and Secondary Batteries:** technologies and applications
"""

# ╔═╡ 2914dd62-31ce-11ec-0509-f75d58f018ee
md"""
## Why Energy Storage?
"""

# ╔═╡ 5aae7e8f-69fe-4a03-b7f4-d1ccade40528
md"""
Energy storage is an essential enabler of the **energy transition**. In the past decades, Europe has shifted from an energy system dominated by centralised fossil fuel generation that can be dispatched to match energy consumption at all times, to a system with more and more renewables.

The energy transition is a pathway toward transformation of the global energy sector from fossil-based to zero-carbon by the second half of this century. [^1][^2]

"""

# ╔═╡ 5577d3ae-3643-4205-93c8-fe2364a014a3
md"""
### Climate change (the Paris Agreement)
$(Resource("https://www.un.org/sites/un2.un.org/files/instagramposters07.jpg", :width => 380)) **Action to reduce the impact of climate change is critical.**

The Paris Agreement sets a goal to limit the increase in global average temperature to well below $$2\rm °C$$ above pre-industrial levels and to attempt to limit the increase to $$1.5\rm °C$$. Implicit in these goals is the need for a transition to a low-carbon energy sector, which accounts for two-thirds of global emissions. Renewable Energy, coupled with energy efficiency gains, can provide $$90\%$$ of the $$CO_2$$ emissions reductions needed by $$2050$$. 

_in  UN Climate Change Conference (COP21), Paris, France, 12 December 2015._ [^3]


"""

# ╔═╡ 030bbd9b-358e-48eb-8943-a2c37873876d


# ╔═╡ 40dc8b0b-1c76-4684-9550-0440b39b3abc
md"""
### SDG 7: Affordable and clean energy

Sustainable Development Goals (SDGs)\
**ENSURE ACCESS TO AFFORDABLE, RELIABLE, SUSTAINABLE AND MODERN ENERGY FOR ALL:**
Renewable energy solutions are becoming cheaper, more reliable and more efficient every day.Our current reliance on fossil fuels is unsustainable and harmful to the planet, which is why we have to change the way we produce and consume energy. Implementing these new energy solutions as fast as possible is essential to counter climate change, one of the biggest threats to our own survival.

![](https://i.imgur.com/wCrX9in.png)

>Source: globalgoals.org, [^4].
"""

# ╔═╡ 3890abd5-f98b-41c8-bf7e-33edb47b079a


# ╔═╡ f305893e-3ba8-4bd0-92e4-16408685ffae
md"""
### Simple climate model
"""

# ╔═╡ e86a1b4f-7a56-47d7-9a7b-c72892865679
md"""
> This section about the "simple climate model" was extracted and slightly changed from the lesson of Prof. Alan Edelman, in **Introduction to Computational Thinking** course, MIT, spring 2021, [^5].
"""

# ╔═╡ ee9caa51-b2e0-4727-b5cd-819dc04c3b91
md"""
#### Climate physics

The simplest climate model can be conceptualized as:
$\begin{align}
\text{\color{brown}{change in heat content}} = & + \text{\color{orange}{absorbed solar radiation (energy from the Sun's rays)}} \newline
& - \text{\color{blue}{outgoing thermal radiation (i.e. blackbody cooling to space)}}
\newline
& + \text{\color{grey}{human-caused greenhouse effect (trapped outgoing radiation)}}
\end{align}$

where each of these is interpreted as an average over the entire globe (hence "zero-dimensional").
"""

# ╔═╡ 33c42c3d-d66b-4c93-8c7b-cc2ef6298310
html"""<img src="https://raw.githubusercontent.com/hdrake/hdrake.github.io/master/figures/planetary_energy_balance.png" height=225>"""

# ╔═╡ 0cd1daa3-d4a0-4e26-b351-da70013530c6
md"""
##### Incoming 🌞: Absorbed solar radiation
"""

# ╔═╡ 001dc8a6-c98b-4fe4-85cf-df9b39928e50
md"""
In math we just write down a differential equation, but in the physical world there are physical variables to identify.

In this heating earth example, the following quantities are identified:

- Industrial Revolution Start: $$1850$$
- Average Temperature in $$1850$$: $$14.0 \rm{°C}$$
- Solar Insolation: $$S=1368 \rm{W/m^2}$$  (energy from the sun)
- Albedo or plentary reflectivity: $$α = 0.3$$
- Atmosphere and upper-ocean heat capacity: $$C= 51 \rm{J/m^2/°C}$$ 
"""

# ╔═╡ f368d304-3725-4930-a383-545585b1aeff
md"""

At Earth's orbital distance from the Sun, the power of the Sun's rays that intercept the Earth is equal to
"""

# ╔═╡ 7a5265d6-9405-4fa0-8c51-8b6b91fac686
S = 1368; # solar insolation [W/m^2]  (energy per unit time per unit area)

# ╔═╡ 17afff44-6082-4041-a7d5-9d2013ff2145
md"A small fraction"

# ╔═╡ 9b75ba46-3900-45b9-b484-140e8f8bd1aa
α = 0.3; # albedo, or planetary reflectivity [unitless]

# ╔═╡ 2d118a19-e8ec-4b39-8932-901008837d10
md"""
of this incoming solar radiation is reflected back out to space (by reflective surfaces like white clouds, snow, and ice), with the remaining fraction $(1-\alpha)$ being absorbed.

Since the incoming solar rays are all approximately parallel this far from the Sun, the cross-sectional area of the Earth that intercepts them is just a disc of area $\pi R^{2}$. Since all of the other terms we will consider act on the entire surface area $4\pi R^{2}$ of the spherical Earth, the absorbed solar radiation *per unit surface area* (averaged over the entire globe) is reduced by a factor of 4.

![](https://www.open.edu/openlearn/ocw/pluginfile.php/101161/mod_oucontent/oucontent/890/639dcd57/ce3f1c3a/s250_3_002i.jpg)

The absorbed solar radiation per unit area is thus

$\textcolor{orange}{\text{absorbed solar radiation} \equiv \frac{S(1-\alpha)}{4}}$
"""

# ╔═╡ 31906aad-d941-4d20-8b74-61ef5dfd057b
absorbed_solar_radiation = S*(1 - α)/4; # [W/m^2]

# ╔═╡ 6d8bc032-c167-4ad0-8f15-de18727be59e
begin
	C = 51.; # atmosphere and upper-ocean heat capacity [J/m^2/°C]
	temp₀ = 14.0 # preindustrial temperature [°C]
end;

# ╔═╡ e4ac2c74-2c69-4b17-97db-25ac3709c9f8
md"""
The heat content $C temp$ is determined by the temperature $temp$ and the heat capacity of the climate system. While we are interested in the temperature of the atmosphere, which has a very small heat capacity, its heat is closely coupled with that of the upper ocean, which has a much larger heat capacity.
"""

# ╔═╡ 76139b65-c5bb-47ad-9d5a-8bdf342a6dcc
md"""
The *change in heat content over time* is thus simply given by $\frac{d(Ctemp)}{dt}$. Since the heat capacity of sea water hardly changes with temperature, we can rewrite this in terms of the change in temperature with time as:

$\color{brown}{\text{change in heat content } =\; C \frac{dtemp}{dt}}$
"""

# ╔═╡ e93b9222-cadd-48ff-b073-77336845896d
md"""
Earth heating formula: \
$C\frac{d temp}{d t}=\frac{S(1-\alpha)}{4}=$ $(S*(1-α)/4)

"""

# ╔═╡ d02aa611-8cc5-44ba-809d-eed5718af9bb
p1 = ODEProblem( (temp, p, t)-> (1/C) * absorbed_solar_radiation, temp₀,  (0.0, 170) )

# ╔═╡ d47ab742-da06-43cc-a9be-82f2c1f13d11
md"""
**(Heating the earth nonstop)**
"""

# ╔═╡ 14f85a9f-d4ce-4ccd-aeb6-81a884915612
begin
	plot(solve(p1),       legend = false, 
		 background_color_inside = :black,
		                  xlabel = "years from $(1850)",
	                      ylabel = "Temperature °C")
	hline!( [temp₀,temp₀] ,c=:white,ls=:dash)
	annotate!( 80, 25+temp₀, text("Preindustrial Temperature = $(temp₀)°C",color=:white))
	title!("Absorbing Solar Radiation (only)")
end

# ╔═╡ 585a0227-58cb-4f93-9b6c-b64d1d04a41e
md"""
##### Outgoing ♨ : thermal radiation
"""

# ╔═╡ 306cf9d2-a141-41f0-b65b-5b1039cb663b
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

# ╔═╡ 113e0091-ddca-41d4-a624-c49542649f51
md"""
The value that has been chosen, based on fitting data is
"""

# ╔═╡ 1e92ba2d-0c0b-468f-ad37-cb89a7e6ddc4
B = 1.3; # climate feedback parameter [W/m^2/°C],

# ╔═╡ 19285170-d51c-4bba-8356-59adf503fb7f
md"""
start\_temp = $(@bind start_temp Slider(0:30; show_value=true, default=14))
"""

# ╔═╡ 34d939cf-cb2b-45ac-995e-b8bd7a9da127
p2 = ODEProblem( (temp, p, t)-> (1/C) * B * (temp₀-temp), start_temp,  (0.0, 172) )

# ╔═╡ 871b0d8a-f3ce-4534-8379-64329e8f7510
begin
	plot(solve(p2),       legend = false, 
		 background_color_inside = :black,
		                  xlabel = "years from start",
	                      ylabel = "Temperature °C",
	                      ylim = (0, 30))
	hline!( [temp₀,temp₀] ,c=:white,ls=:dash)
	annotate!( 80, temp₀, text("Preindustrial Temperature = $(temp₀)°C",:bottom,color=:white))
	title!("Energy Balance Model (Healthy Earth)")
end

# ╔═╡ 09675652-0031-4af5-b572-b724d6cdacf5
md"""
##### Greenhouse 🏭: Human-caused greenhouse effect

Empirically, the greenhouse effect is known to be a logarithmic function of gaseous carbon dioxide (CO₂) concentrations

$\color{grey}{\text{human-caused greenhouse effect}\; = {\mbox {(forcing\_coef)}} \ln \left( \frac{[\text{CO}₂]}{[\text{CO}₂]_{\text{PreIndust}}} \right),}$

How this depends on time into the future depends on human behavior!
Time is not modelled in the above equation. Where:
"""

# ╔═╡ dbf9b18d-9041-4c1d-8c75-ea8f351cf311
forcing_coef = 5.0; # CO2 forcing coefficient [W/m^2]

# ╔═╡ abbb505b-1926-49ea-aefc-97e9bba99b9a
CO₂_PreIndust = 280.; # preindustrial CO2 concentration [parts per million; ppm];

# ╔═╡ 95f10bd7-c6b2-4594-a698-d862403bf7bd
greenhouse_effect(CO₂) = forcing_coef * log(CO₂/CO₂_PreIndust);

# ╔═╡ 0dab2a13-cb04-406e-9225-f80c0ae45317
begin
	CO2_present = 420.
	CO2_range = 280*(2 .^(range(-1, stop=3,length=100)))
	plot(CO2_range, greenhouse_effect.(CO2_range), lw=2.5, 
		label=nothing, color=:black)
	plot!([CO₂_PreIndust], [greenhouse_effect(CO₂_PreIndust)], marker=:., ms=6, 
		linecolor=:white, color=:blue, lw=0, label="pre-industrial (PI)")
	plot!([CO2_present], [greenhouse_effect(CO2_present)], marker=:., ms=6, 
		color=:red, linecolor=:white, lw=0, label="present day (2020)")
	plot!(xticks=[280, 280*2, 280*4, 280*8], legend=:bottomright, size=(600, 350))
	plot!(ylabel="Radiative forcing [W/m²]", xlabel="CO₂ concentration [ppm]")
end

# ╔═╡ b60c3abb-baaf-48ab-b9dc-e38f5515939b
begin
	 # CO₂(t) = CO₂_PreIndust # no emissions
	 # CO₂(t) = CO₂_PreIndust * 1.01^t # test model
	 CO₂(t) = CO₂_PreIndust * (1+ (t/220)^3 ) 	# cubic fit
end

# ╔═╡ ea252ee1-d13a-46b4-ab39-c9f8a95e3d8f
greenhouse_effect(CO₂(15));

# ╔═╡ 75545161-ece6-4c11-97e7-c117646a514c
p3 = ODEProblem( (temp, p, t)-> (1/C) * ( B*(temp₀-temp)  + greenhouse_effect(CO₂(t))    ) , start_temp,  (0.0, 170) )

# ╔═╡ 593cf372-5ce6-4541-8c6a-4a0bcb72303b
begin
	plot(solve(p3),       legend = false, 
		 background_color_inside = :black,
		                  xlabel = "years from 1850",
	                      ylabel = "Temperature °C",
	                      ylim = (10, 20))
	hline!( [temp₀,temp₀] ,c=:white,ls=:dash)
	annotate!( 80, temp₀, text("Preindustrial Temperature = $(temp₀)°C",:bottom,color=:white))
	title!("Model with CO₂")
end

# ╔═╡ 060c4149-16b7-4fe9-8f5c-38710cedcf9b
begin
	years = 1850:2022
	plot( years, CO₂.(years.-1850), lw=3, legend=false)
end

# ╔═╡ 1665189d-c27f-4198-b2bd-9748d5d2a5e6
md"""
#### Observations from Mauna Loa Volcano 
![Mauna Loa Volcano](https://i.pinimg.com/originals/df/1a/e7/df1ae72cfd5e6d0d535c0ec99e708f6f.jpg)
"""

# ╔═╡ daa6e304-e871-41b7-83d8-4689b31458be
begin
	CO2_historical_data_url = "https://scrippsco2.ucsd.edu/assets/data/atmospheric/stations/in_situ_co2/monthly/monthly_in_situ_co2_mlo.csv"
	
	CO2_historical_data = CSV.read(download(CO2_historical_data_url), DataFrame, header=55, datarow=60, );

	first(CO2_historical_data, 11)
end

# ╔═╡ deb5ff75-318a-4fe1-a698-f1ca53ab6f5d
md"""
Data is in the fifth column CO₂
"""

# ╔═╡ 298b9d64-6f4a-4dd2-97f9-a88a80af1ad2
md"""
Oh no, missing data (-99.99)
"""

# ╔═╡ 7734806f-bf36-4507-8f7b-68ef6590fae9
validrowsmask = CO2_historical_data[:, "     CO2"] .> 0

# ╔═╡ e3276a3a-6fd5-480e-a8c0-ece34c2a43a0
begin
	begin
		plot( CO2_historical_data[validrowsmask, "      Date"] , CO2_historical_data[validrowsmask, "     CO2"], label="Mauna Loa CO₂ data (Keeling curve)")
		plot!( years, CO₂.(years.-1850), lw=3 , label="Cubic Fit", legend=:topleft)
		xlabel!("year")
		ylabel!("CO₂ (ppm)")
		title!("CO₂ observations and fit")
		
	end
end

# ╔═╡ 3d682f1c-55d5-4d5f-843a-8a3d6c5ccc98
md"""
We will use this fit to compare against historical temperatures.
"""

# ╔═╡ ff172f31-1ebd-45ad-b8ad-0bca4cf20a3e
md"*Click to reveal observations of global warming* $(@bind show_obs CheckBox(default=false))"

# ╔═╡ 00c58416-15f3-46c1-b623-91407c42a191
md"""
Climate feedback B = $(@bind BB Slider(0:.1:4, show_value=true, default=B))

Ocean Heat Capacity C =$(@bind CC Slider(10:.1:200, show_value=true, default=C))
"""

# ╔═╡ 5319b8d8-39fd-4590-b99b-e8a55f0c90ab
md"""
**CO₂ emissions predict the trend, but what about the climate noise?**
	
This natural noise arises due to the **turbulent and chaotic fluid dynamics** of the atmosphere and ocean, as illustrated below.
"""

# ╔═╡ f769dda2-50d0-47c4-817b-9b2956998c41
html"""

	<div style="padding:0 0 0 0;position:relative;"><iframe width="700" height="394" src="https://www.youtube-nocookie.com/embed/oRsY_UviBPE" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>
"""

# ╔═╡ 893f565f-e5d2-4608-be35-3973c80fdc63
p4 = ODEProblem( (temp, p, t)-> (1/CC) * ( BB*(temp₀-temp)  + greenhouse_effect(CO₂(t))    ) , start_temp,  (0.0, 170) );

# ╔═╡ 62022e8d-8de9-4f88-851a-1b131814505d
solp4 = solve(p4);

# ╔═╡ b183aad5-f739-438c-92ea-9c6c3cef93e3


# ╔═╡ d069ba19-539a-4e26-afc3-13f63f004383
begin
	T_url = "https://data.giss.nasa.gov/gistemp/graphs/graph_data/Global_Mean_Estimates_based_on_Land_and_Ocean_Data/graph.txt";
	T_df = CSV.read(download(T_url),DataFrame, header=false, datarow=6,delim="     ");
    # T_df = T_df[:,[1,6]]
	
end;

# ╔═╡ d051d767-7c4a-4eb0-8716-826588015f7f
begin
	pT=plot(years,solp4.(years.-1850),lw=2, ylims=(13.6,15.2),
		label="Predicted Temperature from model", legend=:topleft)
	xlabel!("year")
	ylabel!("Temp °C")

	if show_obs;
	plot!( parse.(Float64, T_df[:,1]), parse.(Float64, T_df[:,2]) .+ 14.15, color=:black, label="NASA Observations", legend=:topleft)
	end
	plot(pT)
end

# ╔═╡ 3fe36dd4-859d-42d8-b6cd-5180217f0e41


# ╔═╡ d0217b00-3336-4427-8d75-e81ec161a372
md""" 
####  Best- and worst-case projections of future global warming
"""

# ╔═╡ 1528a60b-add4-4bbd-82cf-f23d002801f8
md"""
> The presented graphical results of this section are extracted from lesson of researcher Dr. Henri Drake, about "Introduction to Climate Modeling, Nonlinear Dynamics and Stability" in **Introduction to Computational Thinking** course, MIT, fall 2020, [^6].
"""

# ╔═╡ 1ad0993f-45b7-40c1-b481-87ad95823adc
md"""
Consider two divergent hypothetical futures:
1. a **low-emissions** world in which emissions decrease such that CO2 concentrations stay below 500 ppm by 2100 (known in climate circles as "RCP2.6") and
2. a **high-emissions** world in which emissions continue increasing and CO2 concentrations soar upwards of 1200 ppm ("RCP8.5").
"""

# ╔═╡ e3104381-927a-4c5e-9705-14b2f2197de1
md"""
**RCP** is a suite of scenarios (Representative Concentration Pathways) that describe several potential future pathways. Each scenario defines a pathway in terms of the concentration of carbon in the atmosphere at any date – note that these pathways are defined in terms of the concentration (i.e. the level) of carbon in the atmosphere, not the volume of carbon emissions. 

RCP 8.5 refers to the concentration of carbon that delivers global warming at an average of 8.5 watts per square meter across the planet. The RCP 8.5 pathway delivers a temperature increase of about 4.3˚C by 2100, relative to pre-industrial temperatures. RCP 8.5 is often contrasted with RCP 2.6, which would deliver a total warming of about 1.8˚C by 2100. 

In the characterization of climate change projections, there is debate over whether the climate change scenario RCP 8.5 represents a “business as usual” scenario, a “high emissions” scenario, or a “worst-case” scenario. Further, there are questions about whether RCP 8.5 is consistent with the current trajectory of emissions and whether RCP 8.5 represents the alternate pathway offered by those world leaders championing the use of fossil fuels. 
"""

# ╔═╡ 81e88f5a-5198-4de9-a05f-54975b47f4e2
md"""
![](https://raw.githubusercontent.com/mitmath/18S191/Spring21/notebooks/week12/predictthefuture.svg)
"""

# ╔═╡ a638aa9f-4856-4843-91c9-283d3ccc9a36
md"""
In the low-emissions scenario, the temperature increase stays below $ΔT = 2$ °C by 2100, while in the high-emissions scenario temperatures soar upwards of 3.5ºC above pre-industrial levels.
"""

# ╔═╡ 18a88ea1-8e70-434b-9e62-ba34097b28a8
md"Although the greenhouse effect due to human-caused CO₂ emissions is the dominant forcing behind historical and future-projected warming, modern climate modelling considers a fairly exhaustive list of other forcing factors (aerosols, other greenhouse gases, ozone, land-use changes, etc.). The video below shows a breakdown of these forcing factors in a state-of-the-art climate model simulation of the historical period."

# ╔═╡ 201e6c0d-654b-4d98-8d0f-2961f9c6ba19
html"""
<iframe width="700" height="394" src="https://www.youtube-nocookie.com/embed/E7kMr2OYKSU" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
"""

# ╔═╡ 0fd674c1-3f24-4568-b369-145ff24021d8


# ╔═╡ 28041066-fd7a-4a71-b84b-76d44ff0ed0e


# ╔═╡ f5992d8e-8c20-40e6-bc38-77a581d9d0af
md"""
## Energy storage technologies
"""

# ╔═╡ 97369575-7d63-4c7f-9054-5fe2dc5a4eae
md"""
![](https://ease-storage.eu/wp-content/uploads/2021/03/ar_ease_2020_05_converted_1.png)
>Source: European Association for Storage of Energy (EASE), [^1]
"""

# ╔═╡ 054796f4-05db-4dde-9b5a-a6b8dc034a1b
md"""
### Short-term vs. long-term energy storage systems
"""

# ╔═╡ c371d435-3459-4d8c-a315-4d239e49e396
md"""
![](https://www.psi.ch/sites/default/files/styles/primer_full_xl/public/import/enefficient/StStorEN/ESA_Comparison.png?itok=PkJXvTYp)
"""

# ╔═╡ e8596779-8e18-40bc-8846-4135051967c5


# ╔═╡ f7582a1c-aa9c-496d-bd42-60f44610ba23


# ╔═╡ f92875e8-0139-43d9-a703-ce93cb4bc9bc
md"""
# Supercapacitors

- Ultracapacitors
- Electrical double-layer capacitors
- Aerogel capacitors
"""

# ╔═╡ f6d98e80-1207-42d6-b55a-732a2c727a79
md"""
**Supercapacitor types**
![](https://epci.eu/wp-content/uploads/2020/07/image-9-1024x751.png)

>Source: European Passive Components Institute (EPCI), an educational & information blog with passive components news and technical information. [^7]
"""

# ╔═╡ a3c0d42f-bfe5-4490-8339-6f42423f0db3
md"""
## Applications

* Controlled electric drives

* Renewable energy 

* Diesel electric generators

* STATCOM and power quality

* UPS

* Traction drives
"""

# ╔═╡ c9257a3a-2e79-4eb0-87c9-6bae971e0afd
md"""
> **Main reference:** \
> Petar J. Grbovic, *Ultra-Capacitors in Power Conversion Systems: Analysis, Modeling and Design in Theory and Practice*, John Wiley & Sons Ltd, 2014.
> ![](https://i.imgur.com/zuiL6yW.png)
"""

# ╔═╡ 290b8cac-8834-4b8d-b55f-bf02be1d3875


# ╔═╡ cffa3662-a8ac-46be-abeb-61a91da2c8f3


# ╔═╡ 703b7b5f-6f80-4995-8dd3-afcc367a7583
md"""
# Secondary batteries
## Lead-acid batteries
"""

# ╔═╡ 2c2e15e9-7550-46e9-a73f-c6a539b21483
md"""
**Lead-acid battery chemistry**

![](https://energystorage.org/wp/wp-content/uploads/2020/03/Lead-battery-Chemistry-CBI.jpg)
"""

# ╔═╡ 33498525-3334-4a6e-bd55-a3a28015296a
md"""
The active material is lead dioxide, $$PbO_2$$, on the positive plates, and finely divided lead, $$Pb$$, on the negative plates. Both of these materials react with sulfuric acid, $$H_2SO_4$$, on discharge to form lead sulfate, $$PbSO_4$$, and water, $$H_2O$$, and the reverse reactions take place on recharge.
"""

# ╔═╡ 2f3d5318-c7b6-4288-a94c-da713024e79f


# ╔═╡ 83c4d6b1-0adc-4371-afc8-f0bfd3a6c6b9
md"""
**Construction of a VRLA battery with AGM separators**

![](https://energystorage.org/wp/wp-content/uploads/2020/03/lead-battery.jpg)
"""

# ╔═╡ 3868492e-3059-4071-8297-0362ea121c29
md"""
The lead-acid batteries can be flooded which means that they require maintenance additions of water from time to time or valve-regulated lead-acid (VRLA) types which require no routine maintenance other than safety inspections. VRLA batteries are constructed such that hydrogen evolution is suppressed and oxygen is chemically recombined so that water loss is virtually eliminated. There are two technologies available; one uses an absorptive glass mat (AGM) as the separator and the other uses finely divided silica to gel the electrolyte

> Source: U.S. Energy Storage Association (ESA), [^8].
"""

# ╔═╡ e57f96b4-b395-45c6-805f-844acfc2defd


# ╔═╡ dae4a085-31e3-4920-8450-49bb2252ddd0
md"""
**The global market of lead-acid batteries**

![](https://i.imgur.com/dpksCNr.png)
"""

# ╔═╡ f5611798-02d3-4cb1-8f36-5c392f75b553


# ╔═╡ 7d8fa781-a382-43cb-b133-cc736c99bc3f
md"""
## Lithium-ion batteries
"""

# ╔═╡ 160063b4-b8b9-4dbe-b9f7-8fcafd30b6fc
md"""
**Schematic diagram of the lithium-ion battery**, [^9]

![](https://i.imgur.com/HNDOwGp.png)
"""

# ╔═╡ 1f82fe62-6bd6-4d88-b3f4-9d5471b7598f
md"""
When the lithium ion cell or battery is discharging it provides current to an external circuit. The anode lithium ions are released in an oxidation process which pass to the cathode. The electrons from the ions that have been created flow in the opposite direction, flowing out into the electrical or electronic circuit that is being powered. The ions and electrons then reform at the cathode.

This process releases the chemical energy that is stored in the cell in the form of electrical energy.

During the charging cycle, the reactions occur in the reverse direction with lithium ions passing from the cathode through the electrolyte to the anode. The electrons provided by the external circuit then combine with the lithium ions to provide the stored electrical energy.
"""

# ╔═╡ 3356ef68-1961-4cd1-9c19-99b33589b0e7


# ╔═╡ 602b8c19-d022-4c70-b0b6-2db87904827f
md"""
**Lithium-ion battery technologies**

![](https://i.imgur.com/3ImRnSw.png)

> Source: Battery University™, a free educational website about battery information, [^10].
"""

# ╔═╡ 6d23e2e4-9633-4ea6-b644-da66ae62df80
md"""
**Lithium-ion battery pack**

"""

# ╔═╡ 698099a4-afa8-4708-b971-198598ddb8e7
md"""
![](https://www.large.net/static/images/column_lithium_guide_zhinan.jpg)
"""

# ╔═╡ 452cb5b3-deec-4b92-9f70-44fcbdf6b9b7


# ╔═╡ d97ab7e4-ba29-4e9d-8669-4ad5d8b65c6b
md"""
### What Is C-rate? 💻
"""

# ╔═╡ a4e06819-4037-48ff-abb6-1318ba11ce73
md"""
The capacity of a battery is commonly rated at $$1C$$, meaning that a fully charged battery rated at $$100\rm Ah$$ should provide $$100\rm A$$ for one hour.
"""

# ╔═╡ 029ec281-7c24-4436-bb0d-2090de1f76a6
md"""
**Approximate calculation of run-time**
"""

# ╔═╡ 0e176b54-66b9-47cb-9cba-a5184d545e23
"Battery capacity (Amp-hr)", @bind Amphour NumberField(0:1000, default=100)

# ╔═╡ fa332edf-6487-41b4-b3cf-a10324785b08
"C-rate", @bind C_rate PlutoUI.Slider(0:0.1:12, default=1, show_value=true)

# ╔═╡ d6cb5b92-dd7d-4836-995b-d368bdcff04f
md"""
Calculus:
"""

# ╔═╡ d30f450f-ec86-42f2-b73f-4a878e93a51c
begin
	I=C_rate*Amphour
	I=round(I,digits=2)
	t=Amphour*60/I  # minutes
	t=round(t,digits=1)
end;

# ╔═╡ a3e387b4-eb10-4b90-8e24-3f2e88e9831c
md"""
**Charge/discharge current:** $(I)$$\rm A$$
"""

# ╔═╡ c2ed1541-5957-4807-8a9e-c974f4fd6c41
md"""
**Time to charge /discharge:** $(t) $$\rm min$$
"""

# ╔═╡ 5cff7204-a2e5-4077-8745-341255ca2796


# ╔═╡ 1d08d441-7306-4bcd-bedb-feb5da974ead
md"""
## Li-ion Battery Series and Parallel Connections
"""

# ╔═╡ e8443064-d700-4d19-8682-35ecbfec5d79
md"""
Due to security reasons, Li-ion batteries need an external protection circuit module or board (PCM/PCB) used for battery monitoring for each battery. It is not recommended to use batteries in parallel. If connected in parallel, make sure the consistency of the battery parameters (capacity, internal resistance, etc.), the other batteries in series need to have consistent parameters, otherwise, the performance of the battery pack can be much worse than the performance of a single cell. 
"""

# ╔═╡ 2e032d63-bda1-48cf-9662-15c3985f4753
md"""
![](https://i.imgur.com/iaOBzJA.png)
"""

# ╔═╡ af9229c1-9351-43f6-8371-1201b95bd600
md"""
**Li-ion battery matching criteria:** 
- voltage difference ≤ 10 mv
- impedance difference ≤ 5 mΩ
- capacity difference ≤20mA 
"""

# ╔═╡ 1c27e288-76ad-4c01-82c7-81040c7c0560
md"""
### Two Li-ion Batteries Connected in Series
![](https://i.imgur.com/9ZjobBQ.png)
"""

# ╔═╡ fdad11f6-9699-49e3-a0bc-d3cf55885c6c
md"""
### Three Lithium Batteries Connected in Series
![](https://i.imgur.com/RbyoiTC.png)
"""

# ╔═╡ bb51b451-d77e-40af-84b4-c1c704850fc3
md"""
### Four Lithium Batteries Connected in Series
![](https://i.imgur.com/S3nxgIi.png)

"""

# ╔═╡ 38029956-e504-4e26-af53-75756f89869f
md"""
### Six Lithium Batteries Connected in Series
![](https://i.imgur.com/kPLi8XP.png)
"""

# ╔═╡ 710e59e4-a8ca-41b7-914a-54fd02501cfb
md"""
> Source : [Custom Lithium ion Battery Pack, 18650 Battery China Manufacturer | Large Power](https://www.large.net/)
"""

# ╔═╡ 5b2b8287-2b8d-4b6d-804c-ac6c4aa6ec67
md"""
## BMS - battery management system
![](https://i.imgur.com/AYKj4FP.png)
"""

# ╔═╡ c33357a8-0425-496f-8000-8446040aa47c
md"""
A battery management system (BMS) is any electronic system that manages a rechargeable battery (cell or battery pack), such as by monitoring its state, calculating secondary data, reporting that data, protecting the battery, controlling its environment, and / or balancing it. A BMS may monitor the state of the battery as represented by various items, such as:

- Voltage: total voltage, or voltages of individual cells
- Temperature: average temperature, or temperatures of individual cells
- State of charge (SOC) or depth of discharge (DOD): to indicate the charge level of the battery
- State of health (SOH), a variously-defined measurement of the overall condition of the battery
- Current: current in or out of the battery
"""

# ╔═╡ 69ecaf8e-2d20-4065-a19f-1b46fbbc16f7
md"""
## Applications

- stationary batteries (telecom, UPS, battery banks,..)
![](https://i.imgur.com/0jpPyl1.png)

-  stand-alone applications
![](https://i.imgur.com/GzzZV6W.png)

- Solar and Wind Off Grid systems
![](https://i.imgur.com/8FeSmyp.png)

- Self-consumption and self-sufficiency
![](https://i.imgur.com/OTH67bQ.jpg)

- E-Traction (E-Mobility, Marine, Industrial vehicles, Robotics and Automated Guided Vehicles)
EV and hybrid EVs
![](https://img.technews.tw/wp-content/uploads/2019/06/04154800/Nissan_Leaf_012.jpeg)

- Portable Energy
![](https://i.imgur.com/XH4hbtr.png)

- Electrical power system (generation, transport, distribution)
![](https://api.intechopen.com/media/chapter/42273/media/image3_w.jpg)

"""

# ╔═╡ 142283b4-5b4a-444c-b804-627b1e144577
md"""
>Sources: PowerTech Systems, [^11];  paper, [^12].
"""

# ╔═╡ 011edcbc-5af4-4a03-a35f-457c8490e6aa


# ╔═╡ f601050c-f429-4c32-b51f-2ad851b7587a
md"""
# References
"""

# ╔═╡ 4ec35ef3-38df-4f42-9f34-885fee05ff7b
ref=DOI("10.5772/52220");

# ╔═╡ a1ab1557-f06c-448e-87d6-2236ef1040ad
md"""
[^1]: [The European Association for Storage of Energy](https://ease-storage.eu/)

[^2]: [IRENA – International Renewable Energy Agency](https://www.irena.org/)

[^3]: [ClimateChange | United Nations](https://www.un.org/en/climatechange)

[^4]: [Goal 7: Affordable and clean energy - The Global Goals](https://www.globalgoals.org/goals/7-affordable-and-clean-energy/)

[^5]: [Alan Edelman, "our first climate model", Introduction to Computational Thinking, MIT, spring 2021](https://computationalthinking.mit.edu/Spring21/our_first_climate_model/)

[^6]: [Henri Drake, "Introduction to Climate Modeling, Nonlinear Dynamics and Stability", Introduction to Computational Thinking, MIT, fall 2020](https://computationalthinking.mit.edu/Fall20/lecture20/)

[^7]: [European Passive Components Institute](https://passive-components.eu)

[^8]: [ESA - Energy Storage Association](https://energystorage.org/)

[^9]: Tidblad, A.A, Berg, H., et. all, “Batteries – Present and future challenges”, Swedish Hybrid Vehicle Centre, 2015.

[^10]: [Battery University™](https://batteryuniversity.com/)

[^11]: [PowerTech Systems](https://www.powertechsystems.eu/)

[^12]: 
$(ref)
"""

# ╔═╡ c6c06860-239f-4d01-8d86-fe7830c286d2
md"""
# Further reading
"""

# ╔═╡ 5da4c8df-e610-434d-8f94-b7d3e43302c9
md"""
[Dr. Petar J. Grbović, Ultra-Capacitors in Power Conversion: Applications, Analysis and Design from Theory to Practice, HUAWEI Technologies Duesseldorf GmbH - ppt presentation](https://slideplayer.com/slide/5977050/)

[A Guide to Understanding Battery Specifications, MIT Electric Vehicle Team, December 2008](https://www.web.mit.edu/evt/summary_battery_specifications.pdf)

"""

# ╔═╡ dc8701e0-cd72-460c-8b91-5ab24e45e759


# ╔═╡ 7c2356d3-0474-46d4-a3a6-92768017df4c
md"""
# Setup
"""

# ╔═╡ 8a4a31a3-6489-441c-8777-01c52f69b73b
TableOfContents(title="📚 Table of Contents", depth=6)

# ╔═╡ c6941f77-4ef7-49ae-ac36-1502500d1b02
md"""
!!! info
	In the table of contents of this notebook, the topics marked with "💻" allow user interaction. 
"""

# ╔═╡ f39519da-79a5-4fa9-923c-8c318472c539
md"""
## _Julia packages_
*Links to package help*: \
[PlutoUI](https://juliahub.com/docs/PlutoUI/abXFp/0.7.6/), [ShortCodes](https://github.com/hellemo/ShortCodes.jl), [DifferentialEquations](https://diffeq.sciml.ai/dev/index.html), [Plots](https://docs.juliaplots.org/stable/), [LinearAlgebra](https://docs.julialang.org/en/v1/stdlib/LinearAlgebra/), [CSV](https://csv.juliadata.org/stable/), [DataFrames](https://dataframes.juliadata.org/stable/).
"""

# ╔═╡ b9be702b-000a-4c8c-b7c2-627828b405fc
md"""
!!! info
	## Julia programming and Pluto notebooks
	Know more about: [_Julia_/_Pluto_](https://github.com/Ricardo-Luis/notebooks/blob/main/SAE/README.md)
"""

# ╔═╡ ef9a8257-f8fc-43d3-8016-777c2c9df7e2
version=VERSION;

# ╔═╡ f69e3826-c884-48e4-9e2b-a7ae88c064de
md"""
## _Notebook_

This notebook is designed in Julia programming language version $(version) for the Energy Storage Systems MSc. course (ISEL\MEE) \
**Ricardo Luís** (Adjunct Professor, ISEL\DEEEA\GDME) \
ISEL, 25/Mar/2022
"""

# ╔═╡ 46dfe20a-ebd6-4194-8d87-c15d0e744fe0
md"""
This content is licensed [![](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg)](http://creativecommons.org/licenses/by-sa/4.0/).
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
CSV = "336ed68f-0bac-5ca0-87d4-7b16caf5d00b"
DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
DifferentialEquations = "0c46a032-eb83-5123-abaf-570d42b7fbaa"
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
Plots = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
ShortCodes = "f62ebe17-55c5-4640-972f-b59c0dd11ccf"

[compat]
CSV = "~0.8.5"
DataFrames = "~1.3.2"
DifferentialEquations = "~7.1.0"
Plots = "~1.27.2"
PlutoUI = "~0.7.16"
ShortCodes = "~0.3.2"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[Adapt]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "af92965fb30777147966f58acb05da51c5616b5f"
uuid = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
version = "3.3.3"

[[ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[ArnoldiMethod]]
deps = ["LinearAlgebra", "Random", "StaticArrays"]
git-tree-sha1 = "62e51b39331de8911e4a7ff6f5aaf38a5f4cc0ae"
uuid = "ec485272-7323-5ecc-a04f-4719b315124d"
version = "0.2.0"

[[ArrayInterface]]
deps = ["Compat", "IfElse", "LinearAlgebra", "Requires", "SparseArrays", "Static"]
git-tree-sha1 = "1ee88c4c76caa995a885dc2f22a5d548dfbbc0ba"
uuid = "4fba245c-0d91-5ea0-9b3e-6abc04ee57a9"
version = "3.2.2"

[[ArrayLayouts]]
deps = ["FillArrays", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "56c347caf09ad8acb3e261fe75f8e09652b7b05b"
uuid = "4c555306-a7a7-4459-81d9-ec55ddd5c99a"
version = "0.7.10"

[[Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[BandedMatrices]]
deps = ["ArrayLayouts", "FillArrays", "LinearAlgebra", "Random", "SparseArrays"]
git-tree-sha1 = "019aa88766e2493c59cbd0a9955e1bac683ffbcd"
uuid = "aae01518-5342-5314-be14-df237901396f"
version = "0.16.13"

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[BitTwiddlingConvenienceFunctions]]
deps = ["Static"]
git-tree-sha1 = "28bbdbf0354959db89358d1d79d421ff31ef0b5e"
uuid = "62783981-4cbd-42fc-bca8-16325de8dc4b"
version = "0.1.3"

[[BoundaryValueDiffEq]]
deps = ["BandedMatrices", "DiffEqBase", "FiniteDiff", "ForwardDiff", "LinearAlgebra", "NLsolve", "Reexport", "SparseArrays"]
git-tree-sha1 = "fe34902ac0c3a35d016617ab7032742865756d7d"
uuid = "764a87c0-6b3e-53db-9096-fe964310641d"
version = "2.7.1"

[[Bzip2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "19a35467a82e236ff51bc17a3a44b69ef35185a2"
uuid = "6e34b625-4abd-537c-b88f-471c36dfa7a0"
version = "1.0.8+0"

[[CEnum]]
git-tree-sha1 = "215a9aa4a1f23fbd05b92769fdd62559488d70e9"
uuid = "fa961155-64e5-5f13-b03f-caf6b980ea82"
version = "0.4.1"

[[CPUSummary]]
deps = ["Hwloc", "IfElse", "Preferences", "Static"]
git-tree-sha1 = "7f5830799ee4f40a143f40d6943d421ce985ed88"
uuid = "2a0fbf3d-bb9c-48f3-b0a9-814d99fd7ab9"
version = "0.1.17"

[[CSV]]
deps = ["Dates", "Mmap", "Parsers", "PooledArrays", "SentinelArrays", "Tables", "Unicode"]
git-tree-sha1 = "b83aa3f513be680454437a0eee21001607e5d983"
uuid = "336ed68f-0bac-5ca0-87d4-7b16caf5d00b"
version = "0.8.5"

[[Cairo_jll]]
deps = ["Artifacts", "Bzip2_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "JLLWrappers", "LZO_jll", "Libdl", "Pixman_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "4b859a208b2397a7a623a03449e4636bdb17bcf2"
uuid = "83423d85-b0ee-5818-9007-b63ccbeb887a"
version = "1.16.1+1"

[[Calculus]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "f641eb0a4f00c343bbc32346e1217b86f3ce9dad"
uuid = "49dc2e85-a5d0-5ad3-a950-438e2897f1b9"
version = "0.5.1"

[[ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "9950387274246d08af38f6eef8cb5480862a435f"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.14.0"

[[ChangesOfVariables]]
deps = ["ChainRulesCore", "LinearAlgebra", "Test"]
git-tree-sha1 = "bf98fa45a0a4cee295de98d4c1462be26345b9a1"
uuid = "9e997f8a-9a97-42d5-a9f1-ce6bfc15e2c0"
version = "0.1.2"

[[CloseOpenIntervals]]
deps = ["ArrayInterface", "Static"]
git-tree-sha1 = "f576084239e6bdf801007c80e27e2cc2cd963fe0"
uuid = "fb6a15b2-703c-40df-9091-08a04967cfa9"
version = "0.1.6"

[[CodecZlib]]
deps = ["TranscodingStreams", "Zlib_jll"]
git-tree-sha1 = "ded953804d019afa9a3f98981d99b33e3db7b6da"
uuid = "944b1d66-785c-5afd-91f1-9de20f533193"
version = "0.7.0"

[[ColorSchemes]]
deps = ["ColorTypes", "Colors", "FixedPointNumbers", "Random"]
git-tree-sha1 = "12fc73e5e0af68ad3137b886e3f7c1eacfca2640"
uuid = "35d6a980-a343-548e-a6ea-1d62b119f2f4"
version = "3.17.1"

[[ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "024fe24d83e4a5bf5fc80501a314ce0d1aa35597"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.0"

[[Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "417b0ed7b8b838aa6ca0a87aadf1bb9eb111ce40"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.12.8"

[[CommonSolve]]
git-tree-sha1 = "68a0743f578349ada8bc911a5cbd5a2ef6ed6d1f"
uuid = "38540f10-b2f7-11e9-35d8-d573e4eb0ff2"
version = "0.2.0"

[[CommonSubexpressions]]
deps = ["MacroTools", "Test"]
git-tree-sha1 = "7b8a93dba8af7e3b42fecabf646260105ac373f7"
uuid = "bbf7d656-a473-5ed7-a52c-81e309532950"
version = "0.3.0"

[[Compat]]
deps = ["Base64", "Dates", "DelimitedFiles", "Distributed", "InteractiveUtils", "LibGit2", "Libdl", "LinearAlgebra", "Markdown", "Mmap", "Pkg", "Printf", "REPL", "Random", "SHA", "Serialization", "SharedArrays", "Sockets", "SparseArrays", "Statistics", "Test", "UUIDs", "Unicode"]
git-tree-sha1 = "96b0bc6c52df76506efc8a441c6cf1adcb1babc4"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "3.42.0"

[[CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

[[ConstructionBase]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "f74e9d5388b8620b4cee35d4c5a618dd4dc547f4"
uuid = "187b0558-2788-49d3-abe0-74a17ed4e7c9"
version = "1.3.0"

[[Contour]]
deps = ["StaticArrays"]
git-tree-sha1 = "9f02045d934dc030edad45944ea80dbd1f0ebea7"
uuid = "d38c429a-6771-53c6-b99e-75d170b6e991"
version = "0.5.7"

[[Crayons]]
git-tree-sha1 = "249fe38abf76d48563e2f4556bebd215aa317e15"
uuid = "a8cc5b0e-0ffa-5ad4-8c14-923d3ee1735f"
version = "4.1.1"

[[DEDataArrays]]
deps = ["ArrayInterface", "DocStringExtensions", "LinearAlgebra", "RecursiveArrayTools", "SciMLBase", "StaticArrays"]
git-tree-sha1 = "5e5f8f363c8c9a2415ef9185c4e0ff6966c87d52"
uuid = "754358af-613d-5f8d-9788-280bf1605d4c"
version = "0.2.2"

[[DataAPI]]
git-tree-sha1 = "cc70b17275652eb47bc9e5f81635981f13cea5c8"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.9.0"

[[DataFrames]]
deps = ["Compat", "DataAPI", "Future", "InvertedIndices", "IteratorInterfaceExtensions", "LinearAlgebra", "Markdown", "Missings", "PooledArrays", "PrettyTables", "Printf", "REPL", "Reexport", "SortingAlgorithms", "Statistics", "TableTraits", "Tables", "Unicode"]
git-tree-sha1 = "ae02104e835f219b8930c7664b8012c93475c340"
uuid = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
version = "1.3.2"

[[DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "3daef5523dd2e769dad2365274f760ff5f282c7d"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.11"

[[DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[DelayDiffEq]]
deps = ["ArrayInterface", "DataStructures", "DiffEqBase", "LinearAlgebra", "Logging", "NonlinearSolve", "OrdinaryDiffEq", "Printf", "RecursiveArrayTools", "Reexport", "UnPack"]
git-tree-sha1 = "52f54bd7f7bc1ce794add0ccf08f8fa21acfaed9"
uuid = "bcd4f6db-9728-5f36-b5f7-82caef46ccdb"
version = "5.35.1"

[[DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[DensityInterface]]
deps = ["InverseFunctions", "Test"]
git-tree-sha1 = "80c3e8639e3353e5d2912fb3a1916b8455e2494b"
uuid = "b429d917-457f-4dbc-8f4c-0cc954292b1d"
version = "0.4.0"

[[DiffEqBase]]
deps = ["ArrayInterface", "ChainRulesCore", "DEDataArrays", "DataStructures", "Distributions", "DocStringExtensions", "FastBroadcast", "ForwardDiff", "FunctionWrappers", "IterativeSolvers", "LabelledArrays", "LinearAlgebra", "Logging", "MuladdMacro", "NonlinearSolve", "Parameters", "PreallocationTools", "Printf", "RecursiveArrayTools", "RecursiveFactorization", "Reexport", "Requires", "SciMLBase", "Setfield", "SparseArrays", "StaticArrays", "Statistics", "SuiteSparse", "ZygoteRules"]
git-tree-sha1 = "df03eb34293066d699f8a535d1ccdcff94cb9765"
uuid = "2b5f629d-d688-5b77-993f-72d75c75574e"
version = "6.82.1"

[[DiffEqCallbacks]]
deps = ["DataStructures", "DiffEqBase", "ForwardDiff", "LinearAlgebra", "NLsolve", "OrdinaryDiffEq", "Parameters", "RecipesBase", "RecursiveArrayTools", "SciMLBase", "StaticArrays"]
git-tree-sha1 = "c4b99e3a199e293e7290eea94ba89364d47ee557"
uuid = "459566f4-90b8-5000-8ac3-15dfb0a30def"
version = "2.22.0"

[[DiffEqJump]]
deps = ["ArrayInterface", "Compat", "DataStructures", "DiffEqBase", "FunctionWrappers", "Graphs", "LinearAlgebra", "PoissonRandom", "Random", "RandomNumbers", "RecursiveArrayTools", "Reexport", "StaticArrays", "TreeViews", "UnPack"]
git-tree-sha1 = "eec5fd03c26dadc6b20f84d815309d060358e95b"
uuid = "c894b116-72e5-5b58-be3c-e6d8d4ac2b12"
version = "8.3.0"

[[DiffEqNoiseProcess]]
deps = ["DiffEqBase", "Distributions", "LinearAlgebra", "Optim", "PoissonRandom", "QuadGK", "Random", "Random123", "RandomNumbers", "RecipesBase", "RecursiveArrayTools", "Requires", "ResettableStacks", "SciMLBase", "StaticArrays", "Statistics"]
git-tree-sha1 = "d6839a44a268c69ef0ed927b22a6f43c8a4c2e73"
uuid = "77a26b50-5914-5dd7-bc55-306e6241c503"
version = "5.9.0"

[[DiffResults]]
deps = ["StaticArrays"]
git-tree-sha1 = "c18e98cba888c6c25d1c3b048e4b3380ca956805"
uuid = "163ba53b-c6d8-5494-b064-1a9d43ac40c5"
version = "1.0.3"

[[DiffRules]]
deps = ["IrrationalConstants", "LogExpFunctions", "NaNMath", "Random", "SpecialFunctions"]
git-tree-sha1 = "dd933c4ef7b4c270aacd4eb88fa64c147492acf0"
uuid = "b552c78f-8df3-52c6-915a-8e097449b14b"
version = "1.10.0"

[[DifferentialEquations]]
deps = ["BoundaryValueDiffEq", "DelayDiffEq", "DiffEqBase", "DiffEqCallbacks", "DiffEqJump", "DiffEqNoiseProcess", "LinearAlgebra", "LinearSolve", "OrdinaryDiffEq", "Random", "RecursiveArrayTools", "Reexport", "SteadyStateDiffEq", "StochasticDiffEq", "Sundials"]
git-tree-sha1 = "3f3db9365fedd5fdbecebc3cce86dfdfe5c43c50"
uuid = "0c46a032-eb83-5123-abaf-570d42b7fbaa"
version = "7.1.0"

[[Distances]]
deps = ["LinearAlgebra", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "3258d0659f812acde79e8a74b11f17ac06d0ca04"
uuid = "b4f34e82-e78d-54a5-968a-f98e89d6e8f7"
version = "0.10.7"

[[Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[Distributions]]
deps = ["ChainRulesCore", "DensityInterface", "FillArrays", "LinearAlgebra", "PDMats", "Printf", "QuadGK", "Random", "SparseArrays", "SpecialFunctions", "Statistics", "StatsBase", "StatsFuns", "Test"]
git-tree-sha1 = "c43e992f186abaf9965cc45e372f4693b7754b22"
uuid = "31c24e10-a181-5473-b8eb-7969acd0382f"
version = "0.25.52"

[[DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "b19534d1895d702889b219c382a6e18010797f0b"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.8.6"

[[Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[DualNumbers]]
deps = ["Calculus", "NaNMath", "SpecialFunctions"]
git-tree-sha1 = "5837a837389fccf076445fce071c8ddaea35a566"
uuid = "fa6b7ba4-c1ee-5f82-b5fc-ecf0adba8f74"
version = "0.6.8"

[[EarCut_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "3f3a2501fa7236e9b911e0f7a588c657e822bb6d"
uuid = "5ae413db-bbd1-5e63-b57d-d24a61df00f5"
version = "2.2.3+0"

[[Expat_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "ae13fcbc7ab8f16b0856729b050ef0c446aa3492"
uuid = "2e619515-83b5-522b-bb60-26c02a35a201"
version = "2.4.4+0"

[[ExponentialUtilities]]
deps = ["ArrayInterface", "LinearAlgebra", "Printf", "Requires", "SparseArrays", "libblastrampoline_jll"]
git-tree-sha1 = "b026981973ccbe38682fbb4ccb0732fd6b1e1207"
uuid = "d4d017d3-3776-5f7e-afef-a10c40355c18"
version = "1.13.0"

[[FFMPEG]]
deps = ["FFMPEG_jll"]
git-tree-sha1 = "b57e3acbe22f8484b4b5ff66a7499717fe1a9cc8"
uuid = "c87230d0-a227-11e9-1b43-d7ebe4e7570a"
version = "0.4.1"

[[FFMPEG_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "JLLWrappers", "LAME_jll", "Libdl", "Ogg_jll", "OpenSSL_jll", "Opus_jll", "Pkg", "Zlib_jll", "libass_jll", "libfdk_aac_jll", "libvorbis_jll", "x264_jll", "x265_jll"]
git-tree-sha1 = "d8a578692e3077ac998b50c0217dfd67f21d1e5f"
uuid = "b22a6f82-2f65-5046-a5b2-351ab43fb4e5"
version = "4.4.0+0"

[[FastBroadcast]]
deps = ["LinearAlgebra", "Polyester", "Static"]
git-tree-sha1 = "f39bcc05eb0dcbd2c0195762df7a5737041289b9"
uuid = "7034ab61-46d4-4ed7-9d0f-46aef9175898"
version = "0.1.14"

[[FastClosures]]
git-tree-sha1 = "acebe244d53ee1b461970f8910c235b259e772ef"
uuid = "9aa1b823-49e4-5ca5-8b0f-3971ec8bab6a"
version = "0.3.2"

[[FillArrays]]
deps = ["LinearAlgebra", "Random", "SparseArrays", "Statistics"]
git-tree-sha1 = "deed294cde3de20ae0b2e0355a6c4e1c6a5ceffc"
uuid = "1a297f60-69ca-5386-bcde-b61e274b549b"
version = "0.12.8"

[[FiniteDiff]]
deps = ["ArrayInterface", "LinearAlgebra", "Requires", "SparseArrays", "StaticArrays"]
git-tree-sha1 = "56956d1e4c1221000b7781104c58c34019792951"
uuid = "6a86dc24-6348-571c-b903-95158fe2bd41"
version = "2.11.0"

[[FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[Fontconfig_jll]]
deps = ["Artifacts", "Bzip2_jll", "Expat_jll", "FreeType2_jll", "JLLWrappers", "Libdl", "Libuuid_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "21efd19106a55620a188615da6d3d06cd7f6ee03"
uuid = "a3f928ae-7b40-5064-980b-68af3947d34b"
version = "2.13.93+0"

[[Formatting]]
deps = ["Printf"]
git-tree-sha1 = "8339d61043228fdd3eb658d86c926cb282ae72a8"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.2"

[[ForwardDiff]]
deps = ["CommonSubexpressions", "DiffResults", "DiffRules", "LinearAlgebra", "LogExpFunctions", "NaNMath", "Preferences", "Printf", "Random", "SpecialFunctions", "StaticArrays"]
git-tree-sha1 = "1bd6fc0c344fc0cbee1f42f8d2e7ec8253dda2d2"
uuid = "f6369f11-7733-5829-9624-2563aa707210"
version = "0.10.25"

[[FreeType2_jll]]
deps = ["Artifacts", "Bzip2_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "87eb71354d8ec1a96d4a7636bd57a7347dde3ef9"
uuid = "d7e528f0-a631-5988-bf34-fe36492bcfd7"
version = "2.10.4+0"

[[FriBidi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "aa31987c2ba8704e23c6c8ba8a4f769d5d7e4f91"
uuid = "559328eb-81f9-559d-9380-de523a88c83c"
version = "1.0.10+0"

[[FunctionWrappers]]
git-tree-sha1 = "241552bc2209f0fa068b6415b1942cc0aa486bcc"
uuid = "069b7b12-0de2-55c6-9aab-29f3d0a68a2e"
version = "1.1.2"

[[Future]]
deps = ["Random"]
uuid = "9fa8497b-333b-5362-9e8d-4d0656e87820"

[[GLFW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libglvnd_jll", "Pkg", "Xorg_libXcursor_jll", "Xorg_libXi_jll", "Xorg_libXinerama_jll", "Xorg_libXrandr_jll"]
git-tree-sha1 = "51d2dfe8e590fbd74e7a842cf6d13d8a2f45dc01"
uuid = "0656b61e-2033-5cc2-a64a-77c0f6c09b89"
version = "3.3.6+0"

[[GR]]
deps = ["Base64", "DelimitedFiles", "GR_jll", "HTTP", "JSON", "Libdl", "LinearAlgebra", "Pkg", "Printf", "Random", "RelocatableFolders", "Serialization", "Sockets", "Test", "UUIDs"]
git-tree-sha1 = "9f836fb62492f4b0f0d3b06f55983f2704ed0883"
uuid = "28b8d3ca-fb5f-59d9-8090-bfdbd6d07a71"
version = "0.64.0"

[[GR_jll]]
deps = ["Artifacts", "Bzip2_jll", "Cairo_jll", "FFMPEG_jll", "Fontconfig_jll", "GLFW_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll", "Pixman_jll", "Pkg", "Qt5Base_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "a6c850d77ad5118ad3be4bd188919ce97fffac47"
uuid = "d2c73de3-f751-5644-a686-071e5b155ba9"
version = "0.64.0+0"

[[GeometryBasics]]
deps = ["EarCut_jll", "IterTools", "LinearAlgebra", "StaticArrays", "StructArrays", "Tables"]
git-tree-sha1 = "83ea630384a13fc4f002b77690bc0afeb4255ac9"
uuid = "5c1252a2-5f33-56bf-86c9-59e7332b4326"
version = "0.4.2"

[[Gettext_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "9b02998aba7bf074d14de89f9d37ca24a1a0b046"
uuid = "78b55507-aeef-58d4-861c-77aaff3498b1"
version = "0.21.0+0"

[[Glib_jll]]
deps = ["Artifacts", "Gettext_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Libiconv_jll", "Libmount_jll", "PCRE_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "a32d672ac2c967f3deb8a81d828afc739c838a06"
uuid = "7746bdde-850d-59dc-9ae8-88ece973131d"
version = "2.68.3+2"

[[Graphite2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "344bf40dcab1073aca04aa0df4fb092f920e4011"
uuid = "3b182d85-2403-5c21-9c21-1e1f0cc25472"
version = "1.3.14+0"

[[Graphs]]
deps = ["ArnoldiMethod", "Compat", "DataStructures", "Distributed", "Inflate", "LinearAlgebra", "Random", "SharedArrays", "SimpleTraits", "SparseArrays", "Statistics"]
git-tree-sha1 = "57c021de207e234108a6f1454003120a1bf350c4"
uuid = "86223c79-3864-5bf0-83f7-82e725a168b6"
version = "1.6.0"

[[Grisu]]
git-tree-sha1 = "53bb909d1151e57e2484c3d1b53e19552b887fb2"
uuid = "42e2da0e-8278-4e71-bc24-59509adca0fe"
version = "1.0.2"

[[HTTP]]
deps = ["Base64", "Dates", "IniFile", "Logging", "MbedTLS", "NetworkOptions", "Sockets", "URIs"]
git-tree-sha1 = "14eece7a3308b4d8be910e265c724a6ba51a9798"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "0.9.16"

[[HarfBuzz_jll]]
deps = ["Artifacts", "Cairo_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "Graphite2_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg"]
git-tree-sha1 = "129acf094d168394e80ee1dc4bc06ec835e510a3"
uuid = "2e76f6c2-a576-52d4-95c1-20adfe4de566"
version = "2.8.1+1"

[[HostCPUFeatures]]
deps = ["BitTwiddlingConvenienceFunctions", "IfElse", "Libdl", "Static"]
git-tree-sha1 = "18be5268cf415b5e27f34980ed25a7d34261aa83"
uuid = "3e5b6fbb-0976-4d2c-9146-d79de83f2fb0"
version = "0.1.7"

[[Hwloc]]
deps = ["Hwloc_jll"]
git-tree-sha1 = "92d99146066c5c6888d5a3abc871e6a214388b91"
uuid = "0e44f5e4-bd66-52a0-8798-143a42290a1d"
version = "2.0.0"

[[Hwloc_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "d8bccde6fc8300703673ef9e1383b11403ac1313"
uuid = "e33a78d0-f292-5ffc-b300-72abe9b543c8"
version = "2.7.0+0"

[[HypergeometricFunctions]]
deps = ["DualNumbers", "LinearAlgebra", "SpecialFunctions", "Test"]
git-tree-sha1 = "65e4589030ef3c44d3b90bdc5aac462b4bb05567"
uuid = "34004b35-14d8-5ef3-9330-4cdb6864b03a"
version = "0.3.8"

[[Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[HypertextLiteral]]
git-tree-sha1 = "f6532909bf3d40b308a0f360b6a0e626c0e263a8"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.1"

[[IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[IfElse]]
git-tree-sha1 = "debdd00ffef04665ccbb3e150747a77560e8fad1"
uuid = "615f187c-cbe4-4ef1-ba3b-2fcf58d6d173"
version = "0.1.1"

[[Inflate]]
git-tree-sha1 = "f5fc07d4e706b84f72d54eedcc1c13d92fb0871c"
uuid = "d25df0c9-e2be-5dd7-82c8-3ad0b3e990b9"
version = "0.1.2"

[[IniFile]]
deps = ["Test"]
git-tree-sha1 = "098e4d2c533924c921f9f9847274f2ad89e018b8"
uuid = "83e8ac13-25f8-5344-8a64-a9f2b223428f"
version = "0.5.0"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[InverseFunctions]]
deps = ["Test"]
git-tree-sha1 = "91b5dcf362c5add98049e6c29ee756910b03051d"
uuid = "3587e190-3f89-42d0-90ee-14403ec27112"
version = "0.1.3"

[[InvertedIndices]]
git-tree-sha1 = "bee5f1ef5bf65df56bdd2e40447590b272a5471f"
uuid = "41ab1584-1d38-5bbf-9106-f11c6c58b48f"
version = "1.1.0"

[[IrrationalConstants]]
git-tree-sha1 = "7fd44fd4ff43fc60815f8e764c0f352b83c49151"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.1.1"

[[IterTools]]
git-tree-sha1 = "fa6287a4469f5e048d763df38279ee729fbd44e5"
uuid = "c8e1da08-722c-5040-9ed9-7db0dc04731e"
version = "1.4.0"

[[IterativeSolvers]]
deps = ["LinearAlgebra", "Printf", "Random", "RecipesBase", "SparseArrays"]
git-tree-sha1 = "1169632f425f79429f245113b775a0e3d121457c"
uuid = "42fd0dbc-a981-5370-80f2-aaf504508153"
version = "0.9.2"

[[IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[JLLWrappers]]
deps = ["Preferences"]
git-tree-sha1 = "abc9885a7ca2052a736a600f7fa66209f96506e1"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.4.1"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[JSON3]]
deps = ["Dates", "Mmap", "Parsers", "StructTypes", "UUIDs"]
git-tree-sha1 = "7d58534ffb62cd947950b3aa9b993e63307a6125"
uuid = "0f8b85d8-7281-11e9-16c2-39a750bddbf1"
version = "1.9.2"

[[JpegTurbo_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b53380851c6e6664204efb2e62cd24fa5c47e4ba"
uuid = "aacddb02-875f-59d6-b918-886e6ef4fbf8"
version = "2.1.2+0"

[[KLU]]
deps = ["LinearAlgebra", "SparseArrays", "SuiteSparse_jll"]
git-tree-sha1 = "cae5e3dfd89b209e01bcd65b3a25e74462c67ee0"
uuid = "ef3ab10e-7fda-4108-b977-705223b18434"
version = "0.3.0"

[[Krylov]]
deps = ["LinearAlgebra", "Printf", "SparseArrays"]
git-tree-sha1 = "a024280a69c49f51ba29d2deb66f07508f0b9b49"
uuid = "ba0b0d4f-ebba-5204-a429-3ac8c609bfb7"
version = "0.7.13"

[[KrylovKit]]
deps = ["LinearAlgebra", "Printf"]
git-tree-sha1 = "0328ad9966ae29ccefb4e1b9bfd8c8867e4360df"
uuid = "0b1a1467-8014-51b9-945f-bf0ae24f4b77"
version = "0.5.3"

[[LAME_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "f6250b16881adf048549549fba48b1161acdac8c"
uuid = "c1c5ebd0-6772-5130-a774-d5fcae4a789d"
version = "3.100.1+0"

[[LERC_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "bf36f528eec6634efc60d7ec062008f171071434"
uuid = "88015f11-f218-50d7-93a8-a6af411a945d"
version = "3.0.0+1"

[[LZO_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e5b909bcf985c5e2605737d2ce278ed791b89be6"
uuid = "dd4b983a-f0e5-5f8d-a1b7-129d4a5fb1ac"
version = "2.10.1+0"

[[LaTeXStrings]]
git-tree-sha1 = "f2355693d6778a178ade15952b7ac47a4ff97996"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.3.0"

[[LabelledArrays]]
deps = ["ArrayInterface", "ChainRulesCore", "LinearAlgebra", "MacroTools", "StaticArrays"]
git-tree-sha1 = "fbd884a02f8bf98fd90c53c1c9d2b21f9f30f42a"
uuid = "2ee39098-c373-598a-b85f-a56591580800"
version = "1.8.0"

[[Latexify]]
deps = ["Formatting", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "Printf", "Requires"]
git-tree-sha1 = "4f00cc36fede3c04b8acf9b2e2763decfdcecfa6"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.15.13"

[[LayoutPointers]]
deps = ["ArrayInterface", "LinearAlgebra", "ManualMemory", "SIMDTypes", "Static"]
git-tree-sha1 = "b651f573812d6c36c22c944dd66ef3ab2283dfa1"
uuid = "10f19ff3-798f-405d-979b-55457f8fc047"
version = "0.1.6"

[[LevyArea]]
deps = ["LinearAlgebra", "Random", "SpecialFunctions"]
git-tree-sha1 = "56513a09b8e0ae6485f34401ea9e2f31357958ec"
uuid = "2d8b4e74-eb68-11e8-0fb9-d5eb67b50637"
version = "1.0.0"

[[LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"

[[LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

[[Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[Libffi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "0b4a5d71f3e5200a7dff793393e09dfc2d874290"
uuid = "e9f186c6-92d2-5b65-8a66-fee21dc1b490"
version = "3.2.2+1"

[[Libgcrypt_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgpg_error_jll", "Pkg"]
git-tree-sha1 = "64613c82a59c120435c067c2b809fc61cf5166ae"
uuid = "d4300ac3-e22c-5743-9152-c294e39db1e4"
version = "1.8.7+0"

[[Libglvnd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll", "Xorg_libXext_jll"]
git-tree-sha1 = "7739f837d6447403596a75d19ed01fd08d6f56bf"
uuid = "7e76a0d4-f3c7-5321-8279-8d96eeed0f29"
version = "1.3.0+3"

[[Libgpg_error_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "c333716e46366857753e273ce6a69ee0945a6db9"
uuid = "7add5ba3-2f88-524e-9cd5-f83b8a55f7b8"
version = "1.42.0+0"

[[Libiconv_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "42b62845d70a619f063a7da093d995ec8e15e778"
uuid = "94ce4f54-9a6c-5748-9c1c-f9c7231a4531"
version = "1.16.1+1"

[[Libmount_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "9c30530bf0effd46e15e0fdcf2b8636e78cbbd73"
uuid = "4b2f31a3-9ecc-558c-b454-b3730dcb73e9"
version = "2.35.0+0"

[[Libtiff_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "LERC_jll", "Libdl", "Pkg", "Zlib_jll", "Zstd_jll"]
git-tree-sha1 = "c9551dd26e31ab17b86cbd00c2ede019c08758eb"
uuid = "89763e89-9b03-5906-acba-b20f662cd828"
version = "4.3.0+1"

[[Libuuid_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "7f3efec06033682db852f8b3bc3c1d2b0a0ab066"
uuid = "38a345b3-de98-5d2b-a5d3-14cd9215e700"
version = "2.36.0+0"

[[LineSearches]]
deps = ["LinearAlgebra", "NLSolversBase", "NaNMath", "Parameters", "Printf"]
git-tree-sha1 = "f27132e551e959b3667d8c93eae90973225032dd"
uuid = "d3d80556-e9d4-5f37-9878-2ab0fcc64255"
version = "7.1.1"

[[LinearAlgebra]]
deps = ["Libdl"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[LinearSolve]]
deps = ["ArrayInterface", "DocStringExtensions", "IterativeSolvers", "KLU", "Krylov", "KrylovKit", "LinearAlgebra", "RecursiveFactorization", "Reexport", "Requires", "SciMLBase", "Setfield", "SparseArrays", "SuiteSparse", "UnPack"]
git-tree-sha1 = "a25bc80647e44d0e1e1694b47000603497700b18"
uuid = "7ed4a6bd-45f5-4d41-b270-4a48e9bafcae"
version = "1.13.0"

[[LogExpFunctions]]
deps = ["ChainRulesCore", "ChangesOfVariables", "DocStringExtensions", "InverseFunctions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "58f25e56b706f95125dcb796f39e1fb01d913a71"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.10"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[LoopVectorization]]
deps = ["ArrayInterface", "CPUSummary", "ChainRulesCore", "CloseOpenIntervals", "DocStringExtensions", "ForwardDiff", "HostCPUFeatures", "IfElse", "LayoutPointers", "LinearAlgebra", "OffsetArrays", "PolyesterWeave", "SIMDDualNumbers", "SLEEFPirates", "SpecialFunctions", "Static", "ThreadingUtilities", "UnPack", "VectorizationBase"]
git-tree-sha1 = "077c7c9d746cbe30ac5f001ea4c1277f64cc5dad"
uuid = "bdcacae8-1622-11e9-2a5c-532679323890"
version = "0.12.103"

[[MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "5a5bc6bf062f0f95e62d0fe0a2d99699fed82dd9"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.8"

[[ManualMemory]]
git-tree-sha1 = "bcaef4fc7a0cfe2cba636d84cda54b5e4e4ca3cd"
uuid = "d125e4d3-2237-4719-b19c-fa641b8a4667"
version = "0.1.8"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[MbedTLS]]
deps = ["Dates", "MbedTLS_jll", "Random", "Sockets"]
git-tree-sha1 = "1c38e51c3d08ef2278062ebceade0e46cefc96fe"
uuid = "739be429-bea8-5141-9913-cc70e7f3736d"
version = "1.0.3"

[[MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[Measures]]
git-tree-sha1 = "e498ddeee6f9fdb4551ce855a46f54dbd900245f"
uuid = "442fdcdd-2543-5da2-b0f3-8c86c306513e"
version = "0.3.1"

[[Memoize]]
deps = ["MacroTools"]
git-tree-sha1 = "2b1dfcba103de714d31c033b5dacc2e4a12c7caa"
uuid = "c03570c3-d221-55d1-a50c-7939bbd78826"
version = "0.4.4"

[[Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "bf210ce90b6c9eed32d25dbcae1ebc565df2687f"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.0.2"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[MuladdMacro]]
git-tree-sha1 = "c6190f9a7fc5d9d5915ab29f2134421b12d24a68"
uuid = "46d2c3a1-f734-5fdb-9937-b9b9aeba4221"
version = "0.2.2"

[[NLSolversBase]]
deps = ["DiffResults", "Distributed", "FiniteDiff", "ForwardDiff"]
git-tree-sha1 = "50310f934e55e5ca3912fb941dec199b49ca9b68"
uuid = "d41bc354-129a-5804-8e4c-c37616107c6c"
version = "7.8.2"

[[NLsolve]]
deps = ["Distances", "LineSearches", "LinearAlgebra", "NLSolversBase", "Printf", "Reexport"]
git-tree-sha1 = "019f12e9a1a7880459d0173c182e6a99365d7ac1"
uuid = "2774e3e8-f4cf-5e23-947b-6d7e65073b56"
version = "4.5.1"

[[NaNMath]]
git-tree-sha1 = "b086b7ea07f8e38cf122f5016af580881ac914fe"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "0.3.7"

[[NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[NonlinearSolve]]
deps = ["ArrayInterface", "FiniteDiff", "ForwardDiff", "IterativeSolvers", "LinearAlgebra", "RecursiveArrayTools", "RecursiveFactorization", "Reexport", "SciMLBase", "Setfield", "StaticArrays", "UnPack"]
git-tree-sha1 = "aeebff6a2a23506e5029fd2248a26aca98e477b3"
uuid = "8913a72c-1f9b-4ce2-8d82-65094dcecaec"
version = "0.3.16"

[[OffsetArrays]]
deps = ["Adapt"]
git-tree-sha1 = "043017e0bdeff61cfbb7afeb558ab29536bbb5ed"
uuid = "6fe1bfb0-de20-5000-8ca7-80f57d26f881"
version = "1.10.8"

[[Ogg_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "887579a3eb005446d514ab7aeac5d1d027658b8f"
uuid = "e7412a2a-1a6e-54c0-be00-318e2571c051"
version = "1.3.5+1"

[[OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"

[[OpenLibm_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "05823500-19ac-5b8b-9628-191a04bc5112"

[[OpenSSL_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "ab05aa4cc89736e95915b01e7279e61b1bfe33b8"
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "1.1.14+0"

[[OpenSpecFun_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "13652491f6856acfd2db29360e1bbcd4565d04f1"
uuid = "efe28fd5-8261-553b-a9e1-b2916fc3738e"
version = "0.5.5+0"

[[Optim]]
deps = ["Compat", "FillArrays", "ForwardDiff", "LineSearches", "LinearAlgebra", "NLSolversBase", "NaNMath", "Parameters", "PositiveFactorizations", "Printf", "SparseArrays", "StatsBase"]
git-tree-sha1 = "bc0a748740e8bc5eeb9ea6031e6f050de1fc0ba2"
uuid = "429524aa-4258-5aef-a3af-852621145aeb"
version = "1.6.2"

[[Opus_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "51a08fb14ec28da2ec7a927c4337e4332c2a4720"
uuid = "91d4177d-7536-5919-b921-800302f37372"
version = "1.3.2+0"

[[OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[OrdinaryDiffEq]]
deps = ["Adapt", "ArrayInterface", "DataStructures", "DiffEqBase", "DocStringExtensions", "ExponentialUtilities", "FastClosures", "FiniteDiff", "ForwardDiff", "LinearAlgebra", "LinearSolve", "Logging", "LoopVectorization", "MacroTools", "MuladdMacro", "NLsolve", "NonlinearSolve", "Polyester", "PreallocationTools", "RecursiveArrayTools", "Reexport", "SciMLBase", "SparseArrays", "SparseDiffTools", "StaticArrays", "UnPack"]
git-tree-sha1 = "509aa6d3b2773e5109d4a4dd9a300259ac727961"
uuid = "1dea7af3-3e70-54e6-95c3-0bf5283fa5ed"
version = "6.7.1"

[[PCRE_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b2a7af664e098055a7529ad1a900ded962bca488"
uuid = "2f80f16e-611a-54ab-bc61-aa92de5b98fc"
version = "8.44.0+0"

[[PDMats]]
deps = ["LinearAlgebra", "SparseArrays", "SuiteSparse"]
git-tree-sha1 = "e8185b83b9fc56eb6456200e873ce598ebc7f262"
uuid = "90014a1f-27ba-587c-ab20-58faa44d9150"
version = "0.11.7"

[[Parameters]]
deps = ["OrderedCollections", "UnPack"]
git-tree-sha1 = "34c0e9ad262e5f7fc75b10a9952ca7692cfc5fbe"
uuid = "d96e819e-fc66-5662-9728-84c9c7592b0a"
version = "0.12.3"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "bfd7d8c7fd87f04543810d9cbd3995972236ba1b"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "1.1.2"

[[Pixman_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b4f5d02549a10e20780a24fce72bea96b6329e29"
uuid = "30392449-352a-5448-841d-b1acce4e97dc"
version = "0.40.1+0"

[[Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[PlotThemes]]
deps = ["PlotUtils", "Requires", "Statistics"]
git-tree-sha1 = "a3a964ce9dc7898193536002a6dd892b1b5a6f1d"
uuid = "ccf2f8ad-2431-5c83-bf29-c5338b663b6a"
version = "2.0.1"

[[PlotUtils]]
deps = ["ColorSchemes", "Colors", "Dates", "Printf", "Random", "Reexport", "Statistics"]
git-tree-sha1 = "bb16469fd5224100e422f0b027d26c5a25de1200"
uuid = "995b91a9-d308-5afd-9ec6-746e21dbc043"
version = "1.2.0"

[[Plots]]
deps = ["Base64", "Contour", "Dates", "Downloads", "FFMPEG", "FixedPointNumbers", "GR", "GeometryBasics", "JSON", "Latexify", "LinearAlgebra", "Measures", "NaNMath", "Pkg", "PlotThemes", "PlotUtils", "Printf", "REPL", "Random", "RecipesBase", "RecipesPipeline", "Reexport", "Requires", "Scratch", "Showoff", "SparseArrays", "Statistics", "StatsBase", "UUIDs", "UnicodeFun", "Unzip"]
git-tree-sha1 = "90021b03a38f1ae9dbd7bf4dc5e3dcb7676d302c"
uuid = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
version = "1.27.2"

[[PlutoUI]]
deps = ["Base64", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "4c8a7d080daca18545c56f1cac28710c362478f3"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.16"

[[PoissonRandom]]
deps = ["Random", "Statistics", "Test"]
git-tree-sha1 = "44d018211a56626288b5d3f8c6497d28c26dc850"
uuid = "e409e4f3-bfea-5376-8464-e040bb5c01ab"
version = "0.4.0"

[[Polyester]]
deps = ["ArrayInterface", "BitTwiddlingConvenienceFunctions", "CPUSummary", "IfElse", "ManualMemory", "PolyesterWeave", "Requires", "Static", "StrideArraysCore", "ThreadingUtilities"]
git-tree-sha1 = "ad769d3f29cffb33380ab28318a10c1ccb19c827"
uuid = "f517fe37-dbe3-4b94-8317-1923a5111588"
version = "0.6.7"

[[PolyesterWeave]]
deps = ["BitTwiddlingConvenienceFunctions", "CPUSummary", "IfElse", "Static", "ThreadingUtilities"]
git-tree-sha1 = "7e597df97e46ffb1c8adbaddfa56908a7a20194b"
uuid = "1d0040c9-8b98-4ee7-8388-3f51789ca0ad"
version = "0.1.5"

[[PooledArrays]]
deps = ["DataAPI", "Future"]
git-tree-sha1 = "28ef6c7ce353f0b35d0df0d5930e0d072c1f5b9b"
uuid = "2dfb63ee-cc39-5dd5-95bd-886bf059d720"
version = "1.4.1"

[[PositiveFactorizations]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "17275485f373e6673f7e7f97051f703ed5b15b20"
uuid = "85a6dd25-e78a-55b7-8502-1745935b8125"
version = "0.2.4"

[[PreallocationTools]]
deps = ["Adapt", "ArrayInterface", "ForwardDiff", "LabelledArrays"]
git-tree-sha1 = "6c138c8510111fa47b5d2ed8ada482d97e279bee"
uuid = "d236fae5-4411-538c-8e31-a6e3d9e00b46"
version = "0.2.4"

[[Preferences]]
deps = ["TOML"]
git-tree-sha1 = "d3538e7f8a790dc8903519090857ef8e1283eecd"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.2.5"

[[PrettyTables]]
deps = ["Crayons", "Formatting", "Markdown", "Reexport", "Tables"]
git-tree-sha1 = "dfb54c4e414caa595a1f2ed759b160f5a3ddcba5"
uuid = "08abe8d2-0d0c-5749-adfa-8a2ac140af0d"
version = "1.3.1"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[Qt5Base_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Fontconfig_jll", "Glib_jll", "JLLWrappers", "Libdl", "Libglvnd_jll", "OpenSSL_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libxcb_jll", "Xorg_xcb_util_image_jll", "Xorg_xcb_util_keysyms_jll", "Xorg_xcb_util_renderutil_jll", "Xorg_xcb_util_wm_jll", "Zlib_jll", "xkbcommon_jll"]
git-tree-sha1 = "ad368663a5e20dbb8d6dc2fddeefe4dae0781ae8"
uuid = "ea2cea3b-5b76-57ae-a6ef-0a8af62496e1"
version = "5.15.3+0"

[[QuadGK]]
deps = ["DataStructures", "LinearAlgebra"]
git-tree-sha1 = "78aadffb3efd2155af139781b8a8df1ef279ea39"
uuid = "1fd47b50-473d-5c70-9696-f719f8f3bcdc"
version = "2.4.2"

[[REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[Random123]]
deps = ["Random", "RandomNumbers"]
git-tree-sha1 = "afeacaecf4ed1649555a19cb2cad3c141bbc9474"
uuid = "74087812-796a-5b5d-8853-05524746bad3"
version = "1.5.0"

[[RandomNumbers]]
deps = ["Random", "Requires"]
git-tree-sha1 = "043da614cc7e95c703498a491e2c21f58a2b8111"
uuid = "e6cf234a-135c-5ec9-84dd-332b85af5143"
version = "1.5.3"

[[RecipesBase]]
git-tree-sha1 = "6bf3f380ff52ce0832ddd3a2a7b9538ed1bcca7d"
uuid = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
version = "1.2.1"

[[RecipesPipeline]]
deps = ["Dates", "NaNMath", "PlotUtils", "RecipesBase"]
git-tree-sha1 = "dc1e451e15d90347a7decc4221842a022b011714"
uuid = "01d81517-befc-4cb6-b9ec-a95719d0359c"
version = "0.5.2"

[[RecursiveArrayTools]]
deps = ["Adapt", "ArrayInterface", "ChainRulesCore", "DocStringExtensions", "FillArrays", "LinearAlgebra", "RecipesBase", "Requires", "StaticArrays", "Statistics", "ZygoteRules"]
git-tree-sha1 = "f5dd036acee4462949cc10c55544cc2bee2545d6"
uuid = "731186ca-8d62-57ce-b412-fbd966d074cd"
version = "2.25.1"

[[RecursiveFactorization]]
deps = ["LinearAlgebra", "LoopVectorization", "Polyester", "StrideArraysCore", "TriangularSolve"]
git-tree-sha1 = "7ad4c2ef15b7aecd767b3921c0d255d39b3603ea"
uuid = "f2c3362d-daeb-58d1-803e-2bc74f2840b4"
version = "0.2.9"

[[Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[RelocatableFolders]]
deps = ["SHA", "Scratch"]
git-tree-sha1 = "cdbd3b1338c72ce29d9584fdbe9e9b70eeb5adca"
uuid = "05181044-ff0b-4ac5-8273-598c1e38db00"
version = "0.1.3"

[[Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[ResettableStacks]]
deps = ["StaticArrays"]
git-tree-sha1 = "256eeeec186fa7f26f2801732774ccf277f05db9"
uuid = "ae5879a3-cd67-5da8-be7f-38c6eb64a37b"
version = "1.1.1"

[[Rmath]]
deps = ["Random", "Rmath_jll"]
git-tree-sha1 = "bf3188feca147ce108c76ad82c2792c57abe7b1f"
uuid = "79098fc4-a85e-5d69-aa6a-4863f24498fa"
version = "0.7.0"

[[Rmath_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "68db32dff12bb6127bac73c209881191bf0efbb7"
uuid = "f50d1b31-88e8-58de-be2c-1cc44531875f"
version = "0.3.0+0"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[SIMDDualNumbers]]
deps = ["ForwardDiff", "IfElse", "SLEEFPirates", "VectorizationBase"]
git-tree-sha1 = "62c2da6eb66de8bb88081d20528647140d4daa0e"
uuid = "3cdde19b-5bb0-4aaf-8931-af3e248e098b"
version = "0.1.0"

[[SIMDTypes]]
git-tree-sha1 = "330289636fb8107c5f32088d2741e9fd7a061a5c"
uuid = "94e857df-77ce-4151-89e5-788b33177be4"
version = "0.1.0"

[[SLEEFPirates]]
deps = ["IfElse", "Static", "VectorizationBase"]
git-tree-sha1 = "d4c366b135fc2e1af7a000473e08edc5afd94819"
uuid = "476501e8-09a2-5ece-8869-fb82de89a1fa"
version = "0.6.31"

[[SciMLBase]]
deps = ["ArrayInterface", "CommonSolve", "ConstructionBase", "Distributed", "DocStringExtensions", "IteratorInterfaceExtensions", "LinearAlgebra", "Logging", "RecipesBase", "RecursiveArrayTools", "StaticArrays", "Statistics", "Tables", "TreeViews"]
git-tree-sha1 = "c086056df381502621dc6b5f1d1a0a1c2d0185e7"
uuid = "0bca4576-84f4-4d90-8ffe-ffa030f20462"
version = "1.28.0"

[[Scratch]]
deps = ["Dates"]
git-tree-sha1 = "0b4b7f1393cff97c33891da2a0bf69c6ed241fda"
uuid = "6c6a2e73-6563-6170-7368-637461726353"
version = "1.1.0"

[[SentinelArrays]]
deps = ["Dates", "Random"]
git-tree-sha1 = "6a2f7d70512d205ca8c7ee31bfa9f142fe74310c"
uuid = "91c51154-3ec4-41a3-a24f-3f23e20d615c"
version = "1.3.12"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[Setfield]]
deps = ["ConstructionBase", "Future", "MacroTools", "Requires"]
git-tree-sha1 = "38d88503f695eb0301479bc9b0d4320b378bafe5"
uuid = "efcf1570-3423-57d1-acb7-fd33fddbac46"
version = "0.8.2"

[[SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

[[ShortCodes]]
deps = ["Base64", "CodecZlib", "HTTP", "JSON3", "Memoize", "UUIDs"]
git-tree-sha1 = "866962b3cc79ad3fee73f67408c649498bad1ac0"
uuid = "f62ebe17-55c5-4640-972f-b59c0dd11ccf"
version = "0.3.2"

[[Showoff]]
deps = ["Dates", "Grisu"]
git-tree-sha1 = "91eddf657aca81df9ae6ceb20b959ae5653ad1de"
uuid = "992d4aef-0814-514b-bc4d-f2e9a6c4116f"
version = "1.0.3"

[[SimpleTraits]]
deps = ["InteractiveUtils", "MacroTools"]
git-tree-sha1 = "5d7e3f4e11935503d3ecaf7186eac40602e7d231"
uuid = "699a6c99-e7fa-54fc-8d76-47d257e15c1d"
version = "0.9.4"

[[Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "b3363d7460f7d098ca0912c69b082f75625d7508"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.0.1"

[[SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[SparseDiffTools]]
deps = ["Adapt", "ArrayInterface", "Compat", "DataStructures", "FiniteDiff", "ForwardDiff", "Graphs", "LinearAlgebra", "Requires", "SparseArrays", "StaticArrays", "VertexSafeGraphs"]
git-tree-sha1 = "87efd1676d87706f4079e8e717a7a5f02b6ea1ad"
uuid = "47a9eef4-7e08-11e9-0b38-333d64bd3804"
version = "1.20.2"

[[SpecialFunctions]]
deps = ["ChainRulesCore", "IrrationalConstants", "LogExpFunctions", "OpenLibm_jll", "OpenSpecFun_jll"]
git-tree-sha1 = "5ba658aeecaaf96923dce0da9e703bd1fe7666f9"
uuid = "276daf66-3868-5448-9aa4-cd146d93841b"
version = "2.1.4"

[[Static]]
deps = ["IfElse"]
git-tree-sha1 = "7f5a513baec6f122401abfc8e9c074fdac54f6c1"
uuid = "aedffcd0-7271-4cad-89d0-dc628f76c6d3"
version = "0.4.1"

[[StaticArrays]]
deps = ["LinearAlgebra", "Random", "Statistics"]
git-tree-sha1 = "6976fab022fea2ffea3d945159317556e5dad87c"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.4.2"

[[Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[StatsAPI]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "c3d8ba7f3fa0625b062b82853a7d5229cb728b6b"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.2.1"

[[StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "LogExpFunctions", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "8977b17906b0a1cc74ab2e3a05faa16cf08a8291"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.33.16"

[[StatsFuns]]
deps = ["ChainRulesCore", "HypergeometricFunctions", "InverseFunctions", "IrrationalConstants", "LogExpFunctions", "Reexport", "Rmath", "SpecialFunctions"]
git-tree-sha1 = "25405d7016a47cf2bd6cd91e66f4de437fd54a07"
uuid = "4c63d2b9-4356-54db-8cca-17b64c39e42c"
version = "0.9.16"

[[SteadyStateDiffEq]]
deps = ["DiffEqBase", "DiffEqCallbacks", "LinearAlgebra", "NLsolve", "Reexport", "SciMLBase"]
git-tree-sha1 = "3e057e1f9f12d18cac32011aed9e61eef6c1c0ce"
uuid = "9672c7b4-1e72-59bd-8a11-6ac3964bc41f"
version = "1.6.6"

[[StochasticDiffEq]]
deps = ["Adapt", "ArrayInterface", "DataStructures", "DiffEqBase", "DiffEqJump", "DiffEqNoiseProcess", "DocStringExtensions", "FillArrays", "FiniteDiff", "ForwardDiff", "LevyArea", "LinearAlgebra", "Logging", "MuladdMacro", "NLsolve", "OrdinaryDiffEq", "Random", "RandomNumbers", "RecursiveArrayTools", "Reexport", "SparseArrays", "SparseDiffTools", "StaticArrays", "UnPack"]
git-tree-sha1 = "24d8b3ab7e91b351ccbed5e54499a1864a64a6c6"
uuid = "789caeaf-c7a9-5a7d-9973-96adeb23e2a0"
version = "6.45.0"

[[StrideArraysCore]]
deps = ["ArrayInterface", "CloseOpenIntervals", "IfElse", "LayoutPointers", "ManualMemory", "Requires", "SIMDTypes", "Static", "ThreadingUtilities"]
git-tree-sha1 = "5b76f09a128fcbc0e0d29772d4154728a562e0e0"
uuid = "7792a7ef-975c-4747-a70f-980b88e8d1da"
version = "0.2.14"

[[StructArrays]]
deps = ["Adapt", "DataAPI", "StaticArrays", "Tables"]
git-tree-sha1 = "57617b34fa34f91d536eb265df67c2d4519b8b98"
uuid = "09ab397b-f2b6-538f-b94a-2f83cf4a842a"
version = "0.6.5"

[[StructTypes]]
deps = ["Dates", "UUIDs"]
git-tree-sha1 = "d24a825a95a6d98c385001212dc9020d609f2d4f"
uuid = "856f2bd8-1eba-4b0a-8007-ebc267875bd4"
version = "1.8.1"

[[SuiteSparse]]
deps = ["Libdl", "LinearAlgebra", "Serialization", "SparseArrays"]
uuid = "4607b0f0-06f3-5cda-b6b1-a6196a1729e9"

[[SuiteSparse_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "bea87d4a-7f5b-5778-9afe-8cc45184846c"

[[Sundials]]
deps = ["CEnum", "DataStructures", "DiffEqBase", "Libdl", "LinearAlgebra", "Logging", "Reexport", "SparseArrays", "Sundials_jll"]
git-tree-sha1 = "e0805213754f0d871f9333eacd77862a44acb46d"
uuid = "c3572dad-4567-51f8-b174-8c6c989267f4"
version = "4.9.3"

[[Sundials_jll]]
deps = ["CompilerSupportLibraries_jll", "Libdl", "OpenBLAS_jll", "Pkg", "SuiteSparse_jll"]
git-tree-sha1 = "013ff4504fc1d475aa80c63b455b6b3a58767db2"
uuid = "fb77eaff-e24c-56d4-86b1-d163f2edb164"
version = "5.2.0+1"

[[TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "LinearAlgebra", "OrderedCollections", "TableTraits", "Test"]
git-tree-sha1 = "5ce79ce186cc678bbb5c5681ca3379d1ddae11a1"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.7.0"

[[Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[ThreadingUtilities]]
deps = ["ManualMemory"]
git-tree-sha1 = "f8629df51cab659d70d2e5618a430b4d3f37f2c3"
uuid = "8290d209-cae3-49c0-8002-c8c24d57dab5"
version = "0.5.0"

[[TranscodingStreams]]
deps = ["Random", "Test"]
git-tree-sha1 = "216b95ea110b5972db65aa90f88d8d89dcb8851c"
uuid = "3bb67fe8-82b1-5028-8e26-92a6c54297fa"
version = "0.9.6"

[[TreeViews]]
deps = ["Test"]
git-tree-sha1 = "8d0d7a3fe2f30d6a7f833a5f19f7c7a5b396eae6"
uuid = "a2a6695c-b41b-5b7d-aed9-dbfdeacea5d7"
version = "0.3.0"

[[TriangularSolve]]
deps = ["CloseOpenIntervals", "IfElse", "LayoutPointers", "LinearAlgebra", "LoopVectorization", "Polyester", "Static", "VectorizationBase"]
git-tree-sha1 = "b8d08f55b02625770c09615d96927b3a8396925e"
uuid = "d5829a12-d9aa-46ab-831f-fb7c9ab06edf"
version = "0.1.11"

[[URIs]]
git-tree-sha1 = "97bbe755a53fe859669cd907f2d96aee8d2c1355"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.3.0"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[UnPack]]
git-tree-sha1 = "387c1f73762231e86e0c9c5443ce3b4a0a9a0c2b"
uuid = "3a884ed6-31ef-47d7-9d2a-63182c4928ed"
version = "1.0.2"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[UnicodeFun]]
deps = ["REPL"]
git-tree-sha1 = "53915e50200959667e78a92a418594b428dffddf"
uuid = "1cfade01-22cf-5700-b092-accc4b62d6e1"
version = "0.4.1"

[[Unzip]]
git-tree-sha1 = "34db80951901073501137bdbc3d5a8e7bbd06670"
uuid = "41fe7b60-77ed-43a1-b4f0-825fd5a5650d"
version = "0.1.2"

[[VectorizationBase]]
deps = ["ArrayInterface", "CPUSummary", "HostCPUFeatures", "Hwloc", "IfElse", "LayoutPointers", "Libdl", "LinearAlgebra", "SIMDTypes", "Static"]
git-tree-sha1 = "1901efb08ce6c4526ddf7fdfa9181dc3593fe6a2"
uuid = "3d5dd08c-fd9d-11e8-17fa-ed2836048c2f"
version = "0.21.25"

[[VertexSafeGraphs]]
deps = ["Graphs"]
git-tree-sha1 = "8351f8d73d7e880bfc042a8b6922684ebeafb35c"
uuid = "19fa3120-7c27-5ec5-8db8-b0b0aa330d6f"
version = "0.2.0"

[[Wayland_jll]]
deps = ["Artifacts", "Expat_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "3e61f0b86f90dacb0bc0e73a0c5a83f6a8636e23"
uuid = "a2964d1f-97da-50d4-b82a-358c7fce9d89"
version = "1.19.0+0"

[[Wayland_protocols_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4528479aa01ee1b3b4cd0e6faef0e04cf16466da"
uuid = "2381bf8a-dfd0-557d-9999-79630e7b1b91"
version = "1.25.0+0"

[[XML2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "1acf5bdf07aa0907e0a37d3718bb88d4b687b74a"
uuid = "02c8fc9c-b97f-50b9-bbe4-9be30ff0a78a"
version = "2.9.12+0"

[[XSLT_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgcrypt_jll", "Libgpg_error_jll", "Libiconv_jll", "Pkg", "XML2_jll", "Zlib_jll"]
git-tree-sha1 = "91844873c4085240b95e795f692c4cec4d805f8a"
uuid = "aed1982a-8fda-507f-9586-7b0439959a61"
version = "1.1.34+0"

[[Xorg_libX11_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll", "Xorg_xtrans_jll"]
git-tree-sha1 = "5be649d550f3f4b95308bf0183b82e2582876527"
uuid = "4f6342f7-b3d2-589e-9d20-edeb45f2b2bc"
version = "1.6.9+4"

[[Xorg_libXau_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4e490d5c960c314f33885790ed410ff3a94ce67e"
uuid = "0c0b7dd1-d40b-584c-a123-a41640f87eec"
version = "1.0.9+4"

[[Xorg_libXcursor_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXfixes_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "12e0eb3bc634fa2080c1c37fccf56f7c22989afd"
uuid = "935fb764-8cf2-53bf-bb30-45bb1f8bf724"
version = "1.2.0+4"

[[Xorg_libXdmcp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4fe47bd2247248125c428978740e18a681372dd4"
uuid = "a3789734-cfe1-5b06-b2d0-1dd0d9d62d05"
version = "1.1.3+4"

[[Xorg_libXext_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "b7c0aa8c376b31e4852b360222848637f481f8c3"
uuid = "1082639a-0dae-5f34-9b06-72781eeb8cb3"
version = "1.3.4+4"

[[Xorg_libXfixes_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "0e0dc7431e7a0587559f9294aeec269471c991a4"
uuid = "d091e8ba-531a-589c-9de9-94069b037ed8"
version = "5.0.3+4"

[[Xorg_libXi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXfixes_jll"]
git-tree-sha1 = "89b52bc2160aadc84d707093930ef0bffa641246"
uuid = "a51aa0fd-4e3c-5386-b890-e753decda492"
version = "1.7.10+4"

[[Xorg_libXinerama_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll"]
git-tree-sha1 = "26be8b1c342929259317d8b9f7b53bf2bb73b123"
uuid = "d1454406-59df-5ea1-beac-c340f2130bc3"
version = "1.1.4+4"

[[Xorg_libXrandr_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "34cea83cb726fb58f325887bf0612c6b3fb17631"
uuid = "ec84b674-ba8e-5d96-8ba1-2a689ba10484"
version = "1.5.2+4"

[[Xorg_libXrender_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "19560f30fd49f4d4efbe7002a1037f8c43d43b96"
uuid = "ea2f1a96-1ddc-540d-b46f-429655e07cfa"
version = "0.9.10+4"

[[Xorg_libpthread_stubs_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "6783737e45d3c59a4a4c4091f5f88cdcf0908cbb"
uuid = "14d82f49-176c-5ed1-bb49-ad3f5cbd8c74"
version = "0.1.0+3"

[[Xorg_libxcb_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "XSLT_jll", "Xorg_libXau_jll", "Xorg_libXdmcp_jll", "Xorg_libpthread_stubs_jll"]
git-tree-sha1 = "daf17f441228e7a3833846cd048892861cff16d6"
uuid = "c7cfdc94-dc32-55de-ac96-5a1b8d977c5b"
version = "1.13.0+3"

[[Xorg_libxkbfile_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "926af861744212db0eb001d9e40b5d16292080b2"
uuid = "cc61e674-0454-545c-8b26-ed2c68acab7a"
version = "1.1.0+4"

[[Xorg_xcb_util_image_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "0fab0a40349ba1cba2c1da699243396ff8e94b97"
uuid = "12413925-8142-5f55-bb0e-6d7ca50bb09b"
version = "0.4.0+1"

[[Xorg_xcb_util_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll"]
git-tree-sha1 = "e7fd7b2881fa2eaa72717420894d3938177862d1"
uuid = "2def613f-5ad1-5310-b15b-b15d46f528f5"
version = "0.4.0+1"

[[Xorg_xcb_util_keysyms_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "d1151e2c45a544f32441a567d1690e701ec89b00"
uuid = "975044d2-76e6-5fbe-bf08-97ce7c6574c7"
version = "0.4.0+1"

[[Xorg_xcb_util_renderutil_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "dfd7a8f38d4613b6a575253b3174dd991ca6183e"
uuid = "0d47668e-0667-5a69-a72c-f761630bfb7e"
version = "0.3.9+1"

[[Xorg_xcb_util_wm_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "e78d10aab01a4a154142c5006ed44fd9e8e31b67"
uuid = "c22f9ab0-d5fe-5066-847c-f4bb1cd4e361"
version = "0.4.1+1"

[[Xorg_xkbcomp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxkbfile_jll"]
git-tree-sha1 = "4bcbf660f6c2e714f87e960a171b119d06ee163b"
uuid = "35661453-b289-5fab-8a00-3d9160c6a3a4"
version = "1.4.2+4"

[[Xorg_xkeyboard_config_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xkbcomp_jll"]
git-tree-sha1 = "5c8424f8a67c3f2209646d4425f3d415fee5931d"
uuid = "33bec58e-1273-512f-9401-5d533626f822"
version = "2.27.0+4"

[[Xorg_xtrans_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "79c31e7844f6ecf779705fbc12146eb190b7d845"
uuid = "c5fb5394-a638-5e4d-96e5-b29de1b5cf10"
version = "1.4.0+3"

[[Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[Zstd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e45044cd873ded54b6a5bac0eb5c971392cf1927"
uuid = "3161d3a3-bdf6-5164-811a-617609db77b4"
version = "1.5.2+0"

[[ZygoteRules]]
deps = ["MacroTools"]
git-tree-sha1 = "8c1a8e4dfacb1fd631745552c8db35d0deb09ea0"
uuid = "700de1a5-db45-46bc-99cf-38207098b444"
version = "0.2.2"

[[libass_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "HarfBuzz_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "5982a94fcba20f02f42ace44b9894ee2b140fe47"
uuid = "0ac62f75-1d6f-5e53-bd7c-93b484bb37c0"
version = "0.15.1+0"

[[libblastrampoline_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "576c27f2c23add3ce8f10717d72fbaee6fe120e9"
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "3.1.0+2"

[[libfdk_aac_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "daacc84a041563f965be61859a36e17c4e4fcd55"
uuid = "f638f0a6-7fb0-5443-88ba-1cc74229b280"
version = "2.0.2+0"

[[libpng_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "94d180a6d2b5e55e447e2d27a29ed04fe79eb30c"
uuid = "b53b4c65-9356-5827-b1ea-8c7a1a84506f"
version = "1.6.38+0"

[[libvorbis_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Ogg_jll", "Pkg"]
git-tree-sha1 = "b910cb81ef3fe6e78bf6acee440bda86fd6ae00c"
uuid = "f27f6e37-5d2b-51aa-960f-b287f2bc3b7a"
version = "1.3.7+1"

[[nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"

[[x264_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4fea590b89e6ec504593146bf8b988b2c00922b2"
uuid = "1270edf5-f2f9-52d2-97e9-ab00b5d0237a"
version = "2021.5.5+0"

[[x265_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "ee567a171cce03570d77ad3a43e90218e38937a9"
uuid = "dfaa095f-4041-5dcd-9319-2fabd8486b76"
version = "3.5.0+0"

[[xkbcommon_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Wayland_jll", "Wayland_protocols_jll", "Xorg_libxcb_jll", "Xorg_xkeyboard_config_jll"]
git-tree-sha1 = "ece2350174195bb31de1a63bea3a41ae1aa593b6"
uuid = "d8fb68d0-12a3-5cfd-a85a-d49703b185fd"
version = "0.9.1+5"
"""

# ╔═╡ Cell order:
# ╟─d4029651-28e7-4197-9c5e-d192617458e3
# ╟─95d58f42-47c8-4709-a4a1-8a9b5e932dd9
# ╟─2914dd62-31ce-11ec-0509-f75d58f018ee
# ╟─5aae7e8f-69fe-4a03-b7f4-d1ccade40528
# ╟─5577d3ae-3643-4205-93c8-fe2364a014a3
# ╟─030bbd9b-358e-48eb-8943-a2c37873876d
# ╟─40dc8b0b-1c76-4684-9550-0440b39b3abc
# ╟─3890abd5-f98b-41c8-bf7e-33edb47b079a
# ╟─f305893e-3ba8-4bd0-92e4-16408685ffae
# ╟─e86a1b4f-7a56-47d7-9a7b-c72892865679
# ╟─ee9caa51-b2e0-4727-b5cd-819dc04c3b91
# ╟─33c42c3d-d66b-4c93-8c7b-cc2ef6298310
# ╟─0cd1daa3-d4a0-4e26-b351-da70013530c6
# ╟─001dc8a6-c98b-4fe4-85cf-df9b39928e50
# ╟─f368d304-3725-4930-a383-545585b1aeff
# ╠═7a5265d6-9405-4fa0-8c51-8b6b91fac686
# ╟─17afff44-6082-4041-a7d5-9d2013ff2145
# ╠═9b75ba46-3900-45b9-b484-140e8f8bd1aa
# ╟─2d118a19-e8ec-4b39-8932-901008837d10
# ╠═31906aad-d941-4d20-8b74-61ef5dfd057b
# ╟─6d8bc032-c167-4ad0-8f15-de18727be59e
# ╟─e4ac2c74-2c69-4b17-97db-25ac3709c9f8
# ╟─76139b65-c5bb-47ad-9d5a-8bdf342a6dcc
# ╟─e93b9222-cadd-48ff-b073-77336845896d
# ╠═d02aa611-8cc5-44ba-809d-eed5718af9bb
# ╟─d47ab742-da06-43cc-a9be-82f2c1f13d11
# ╟─14f85a9f-d4ce-4ccd-aeb6-81a884915612
# ╟─585a0227-58cb-4f93-9b6c-b64d1d04a41e
# ╟─306cf9d2-a141-41f0-b65b-5b1039cb663b
# ╟─113e0091-ddca-41d4-a624-c49542649f51
# ╠═1e92ba2d-0c0b-468f-ad37-cb89a7e6ddc4
# ╟─19285170-d51c-4bba-8356-59adf503fb7f
# ╠═34d939cf-cb2b-45ac-995e-b8bd7a9da127
# ╟─871b0d8a-f3ce-4534-8379-64329e8f7510
# ╟─09675652-0031-4af5-b572-b724d6cdacf5
# ╠═dbf9b18d-9041-4c1d-8c75-ea8f351cf311
# ╠═abbb505b-1926-49ea-aefc-97e9bba99b9a
# ╠═95f10bd7-c6b2-4594-a698-d862403bf7bd
# ╟─ea252ee1-d13a-46b4-ab39-c9f8a95e3d8f
# ╟─0dab2a13-cb04-406e-9225-f80c0ae45317
# ╠═b60c3abb-baaf-48ab-b9dc-e38f5515939b
# ╠═75545161-ece6-4c11-97e7-c117646a514c
# ╟─593cf372-5ce6-4541-8c6a-4a0bcb72303b
# ╟─060c4149-16b7-4fe9-8f5c-38710cedcf9b
# ╟─1665189d-c27f-4198-b2bd-9748d5d2a5e6
# ╟─daa6e304-e871-41b7-83d8-4689b31458be
# ╟─deb5ff75-318a-4fe1-a698-f1ca53ab6f5d
# ╟─298b9d64-6f4a-4dd2-97f9-a88a80af1ad2
# ╠═7734806f-bf36-4507-8f7b-68ef6590fae9
# ╟─e3276a3a-6fd5-480e-a8c0-ece34c2a43a0
# ╟─3d682f1c-55d5-4d5f-843a-8a3d6c5ccc98
# ╟─ff172f31-1ebd-45ad-b8ad-0bca4cf20a3e
# ╟─d051d767-7c4a-4eb0-8716-826588015f7f
# ╟─00c58416-15f3-46c1-b623-91407c42a191
# ╟─5319b8d8-39fd-4590-b99b-e8a55f0c90ab
# ╟─f769dda2-50d0-47c4-817b-9b2956998c41
# ╠═893f565f-e5d2-4608-be35-3973c80fdc63
# ╠═62022e8d-8de9-4f88-851a-1b131814505d
# ╠═b183aad5-f739-438c-92ea-9c6c3cef93e3
# ╠═d069ba19-539a-4e26-afc3-13f63f004383
# ╟─3fe36dd4-859d-42d8-b6cd-5180217f0e41
# ╟─d0217b00-3336-4427-8d75-e81ec161a372
# ╟─1528a60b-add4-4bbd-82cf-f23d002801f8
# ╟─1ad0993f-45b7-40c1-b481-87ad95823adc
# ╟─e3104381-927a-4c5e-9705-14b2f2197de1
# ╟─81e88f5a-5198-4de9-a05f-54975b47f4e2
# ╟─a638aa9f-4856-4843-91c9-283d3ccc9a36
# ╟─18a88ea1-8e70-434b-9e62-ba34097b28a8
# ╟─201e6c0d-654b-4d98-8d0f-2961f9c6ba19
# ╟─0fd674c1-3f24-4568-b369-145ff24021d8
# ╟─28041066-fd7a-4a71-b84b-76d44ff0ed0e
# ╟─f5992d8e-8c20-40e6-bc38-77a581d9d0af
# ╟─97369575-7d63-4c7f-9054-5fe2dc5a4eae
# ╟─054796f4-05db-4dde-9b5a-a6b8dc034a1b
# ╟─c371d435-3459-4d8c-a315-4d239e49e396
# ╟─e8596779-8e18-40bc-8846-4135051967c5
# ╟─f7582a1c-aa9c-496d-bd42-60f44610ba23
# ╟─f92875e8-0139-43d9-a703-ce93cb4bc9bc
# ╟─f6d98e80-1207-42d6-b55a-732a2c727a79
# ╟─a3c0d42f-bfe5-4490-8339-6f42423f0db3
# ╟─c9257a3a-2e79-4eb0-87c9-6bae971e0afd
# ╟─290b8cac-8834-4b8d-b55f-bf02be1d3875
# ╟─cffa3662-a8ac-46be-abeb-61a91da2c8f3
# ╟─703b7b5f-6f80-4995-8dd3-afcc367a7583
# ╟─2c2e15e9-7550-46e9-a73f-c6a539b21483
# ╟─33498525-3334-4a6e-bd55-a3a28015296a
# ╟─2f3d5318-c7b6-4288-a94c-da713024e79f
# ╟─83c4d6b1-0adc-4371-afc8-f0bfd3a6c6b9
# ╟─3868492e-3059-4071-8297-0362ea121c29
# ╟─e57f96b4-b395-45c6-805f-844acfc2defd
# ╟─dae4a085-31e3-4920-8450-49bb2252ddd0
# ╟─f5611798-02d3-4cb1-8f36-5c392f75b553
# ╟─7d8fa781-a382-43cb-b133-cc736c99bc3f
# ╟─160063b4-b8b9-4dbe-b9f7-8fcafd30b6fc
# ╟─1f82fe62-6bd6-4d88-b3f4-9d5471b7598f
# ╟─3356ef68-1961-4cd1-9c19-99b33589b0e7
# ╟─602b8c19-d022-4c70-b0b6-2db87904827f
# ╟─6d23e2e4-9633-4ea6-b644-da66ae62df80
# ╟─698099a4-afa8-4708-b971-198598ddb8e7
# ╟─452cb5b3-deec-4b92-9f70-44fcbdf6b9b7
# ╟─d97ab7e4-ba29-4e9d-8669-4ad5d8b65c6b
# ╟─a4e06819-4037-48ff-abb6-1318ba11ce73
# ╟─029ec281-7c24-4436-bb0d-2090de1f76a6
# ╟─0e176b54-66b9-47cb-9cba-a5184d545e23
# ╟─fa332edf-6487-41b4-b3cf-a10324785b08
# ╟─a3e387b4-eb10-4b90-8e24-3f2e88e9831c
# ╟─c2ed1541-5957-4807-8a9e-c974f4fd6c41
# ╟─d6cb5b92-dd7d-4836-995b-d368bdcff04f
# ╠═d30f450f-ec86-42f2-b73f-4a878e93a51c
# ╟─5cff7204-a2e5-4077-8745-341255ca2796
# ╟─1d08d441-7306-4bcd-bedb-feb5da974ead
# ╟─e8443064-d700-4d19-8682-35ecbfec5d79
# ╟─2e032d63-bda1-48cf-9662-15c3985f4753
# ╟─af9229c1-9351-43f6-8371-1201b95bd600
# ╟─1c27e288-76ad-4c01-82c7-81040c7c0560
# ╟─fdad11f6-9699-49e3-a0bc-d3cf55885c6c
# ╟─bb51b451-d77e-40af-84b4-c1c704850fc3
# ╟─38029956-e504-4e26-af53-75756f89869f
# ╟─710e59e4-a8ca-41b7-914a-54fd02501cfb
# ╟─5b2b8287-2b8d-4b6d-804c-ac6c4aa6ec67
# ╟─c33357a8-0425-496f-8000-8446040aa47c
# ╟─69ecaf8e-2d20-4065-a19f-1b46fbbc16f7
# ╟─142283b4-5b4a-444c-b804-627b1e144577
# ╟─011edcbc-5af4-4a03-a35f-457c8490e6aa
# ╟─f601050c-f429-4c32-b51f-2ad851b7587a
# ╠═a1ab1557-f06c-448e-87d6-2236ef1040ad
# ╟─4ec35ef3-38df-4f42-9f34-885fee05ff7b
# ╟─c6c06860-239f-4d01-8d86-fe7830c286d2
# ╟─5da4c8df-e610-434d-8f94-b7d3e43302c9
# ╟─dc8701e0-cd72-460c-8b91-5ab24e45e759
# ╟─7c2356d3-0474-46d4-a3a6-92768017df4c
# ╠═8a4a31a3-6489-441c-8777-01c52f69b73b
# ╟─c6941f77-4ef7-49ae-ac36-1502500d1b02
# ╟─f39519da-79a5-4fa9-923c-8c318472c539
# ╠═52e498f6-1043-4326-9ad4-f2b55af4ba48
# ╟─b9be702b-000a-4c8c-b7c2-627828b405fc
# ╟─f69e3826-c884-48e4-9e2b-a7ae88c064de
# ╟─ef9a8257-f8fc-43d3-8016-777c2c9df7e2
# ╟─46dfe20a-ebd6-4194-8d87-c15d0e744fe0
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
