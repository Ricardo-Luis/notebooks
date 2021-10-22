### A Pluto.jl notebook ###
# v0.16.1

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 52e498f6-1043-4326-9ad4-f2b55af4ba48
begin
	using PlutoUI # Pluto.jl user-interface
	using ShortCodes# for citations
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
#### Climate change (the Paris Agreement)
$(Resource("https://www.un.org/sites/un2.un.org/files/instagramposters07.jpg", :width => 380)) **Action to reduce the impact of climate change is critical.**

The Paris Agreement sets a goal to limit the increase in global average temperature to well below $$2\rm °C$$ above pre-industrial levels and to attempt to limit the increase to $$1.5\rm °C$$. Implicit in these goals is the need for a transition to a low-carbon energy sector, which accounts for two-thirds of global emissions. Renewable Energy, coupled with energy efficiency gains, can provide $$90\%$$ of the $$CO_2$$ emissions reductions needed by $$2050$$. 

_in  UN Climate Change Conference (COP21), Paris, France, 12 December 2015._ [^3]


"""

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

>Source: European Passive Components Institute (EPCI), an educational & information blog with passive components news and technical information. [^4]
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
> **Main reference:**
> Petar J. Grbovic, Ultra-Capacitors in Power Conversion Systems: Analysis, Modeling and Design in Theory and Practice, John Wiley & Sons Ltd, 2014.
> ![](https://m.media-amazon.com/images/P/1118356268.01._SCLZZZZZZZ_SX500_.jpg)
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

> Source: U.S. Energy Storage Association (ESA), [^5].
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
**Schematic diagram of the lithium-ion battery**, [^6]

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

> Source: Battery University™, a free educational website about battery information, [^7].
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
"Battery capacity (Amp-hr)", @bind C NumberField(0:1000, default=100)

# ╔═╡ fa332edf-6487-41b4-b3cf-a10324785b08
"C-rate", @bind C_rate PlutoUI.Slider(0:0.1:12, default=1, show_value=true)

# ╔═╡ d6cb5b92-dd7d-4836-995b-d368bdcff04f
md"""
Calculus:
"""

# ╔═╡ d30f450f-ec86-42f2-b73f-4a878e93a51c
begin
	I=C_rate*C
	I=round(I,digits=2)
	t=C*60/I  # minutes
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
>Sources: PowerTech Systems, [^8];  paper, [^9].
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

[^4]: [European Passive Components Institute](https://passive-components.eu)



[^5]: [ESA - Energy Storage Association](https://energystorage.org/)


[^6]: Tidblad, A.A, Berg, H., et. all, “Batteries – Present and future challenges”, Swedish Hybrid Vehicle Centre, 2015.


[^7]: [Battery University™](https://batteryuniversity.com/)

[^8]: [PowerTech Systems](https://www.powertechsystems.eu/)

[^9]:
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
TableOfContents(title="📚 Table of Contents")

# ╔═╡ c6941f77-4ef7-49ae-ac36-1502500d1b02
md"""
!!! info
	In the table of contents of this notebook, the topics marked with "💻" allow user interaction. 
"""

# ╔═╡ f39519da-79a5-4fa9-923c-8c318472c539
md"""
## _Julia packages_
*Links to package help*: [PlutoUI](https://juliahub.com/docs/PlutoUI/abXFp/0.7.6/), [ShortCodes](https://github.com/hellemo/ShortCodes.jl).
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
ISEL, 22/Out/2021
"""

# ╔═╡ 46dfe20a-ebd6-4194-8d87-c15d0e744fe0
md"""
This content is licensed [![](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg)](http://creativecommons.org/licenses/by-sa/4.0/).
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
ShortCodes = "f62ebe17-55c5-4640-972f-b59c0dd11ccf"

[compat]
PlutoUI = "~0.7.16"
ShortCodes = "~0.3.2"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[CodecZlib]]
deps = ["TranscodingStreams", "Zlib_jll"]
git-tree-sha1 = "ded953804d019afa9a3f98981d99b33e3db7b6da"
uuid = "944b1d66-785c-5afd-91f1-9de20f533193"
version = "0.7.0"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[HTTP]]
deps = ["Base64", "Dates", "IniFile", "Logging", "MbedTLS", "NetworkOptions", "Sockets", "URIs"]
git-tree-sha1 = "14eece7a3308b4d8be910e265c724a6ba51a9798"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "0.9.16"

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

[[IniFile]]
deps = ["Test"]
git-tree-sha1 = "098e4d2c533924c921f9f9847274f2ad89e018b8"
uuid = "83e8ac13-25f8-5344-8a64-a9f2b223428f"
version = "0.5.0"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

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

[[Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "5a5bc6bf062f0f95e62d0fe0a2d99699fed82dd9"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.8"

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

[[Memoize]]
deps = ["MacroTools"]
git-tree-sha1 = "2b1dfcba103de714d31c033b5dacc2e4a12c7caa"
uuid = "c03570c3-d221-55d1-a50c-7939bbd78826"
version = "0.4.4"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "bfd7d8c7fd87f04543810d9cbd3995972236ba1b"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "1.1.2"

[[PlutoUI]]
deps = ["Base64", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "4c8a7d080daca18545c56f1cac28710c362478f3"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.16"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[ShortCodes]]
deps = ["Base64", "CodecZlib", "HTTP", "JSON3", "Memoize", "UUIDs"]
git-tree-sha1 = "866962b3cc79ad3fee73f67408c649498bad1ac0"
uuid = "f62ebe17-55c5-4640-972f-b59c0dd11ccf"
version = "0.3.2"

[[Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[StructTypes]]
deps = ["Dates", "UUIDs"]
git-tree-sha1 = "d24a825a95a6d98c385001212dc9020d609f2d4f"
uuid = "856f2bd8-1eba-4b0a-8007-ebc267875bd4"
version = "1.8.1"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[TranscodingStreams]]
deps = ["Random", "Test"]
git-tree-sha1 = "216b95ea110b5972db65aa90f88d8d89dcb8851c"
uuid = "3bb67fe8-82b1-5028-8e26-92a6c54297fa"
version = "0.9.6"

[[URIs]]
git-tree-sha1 = "97bbe755a53fe859669cd907f2d96aee8d2c1355"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.3.0"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
"""

# ╔═╡ Cell order:
# ╟─d4029651-28e7-4197-9c5e-d192617458e3
# ╟─95d58f42-47c8-4709-a4a1-8a9b5e932dd9
# ╟─2914dd62-31ce-11ec-0509-f75d58f018ee
# ╟─5aae7e8f-69fe-4a03-b7f4-d1ccade40528
# ╟─5577d3ae-3643-4205-93c8-fe2364a014a3
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
# ╠═0e176b54-66b9-47cb-9cba-a5184d545e23
# ╟─fa332edf-6487-41b4-b3cf-a10324785b08
# ╟─a3e387b4-eb10-4b90-8e24-3f2e88e9831c
# ╟─c2ed1541-5957-4807-8a9e-c974f4fd6c41
# ╟─d6cb5b92-dd7d-4836-995b-d368bdcff04f
# ╠═d30f450f-ec86-42f2-b73f-4a878e93a51c
# ╟─5cff7204-a2e5-4077-8745-341255ca2796
# ╟─69ecaf8e-2d20-4065-a19f-1b46fbbc16f7
# ╟─142283b4-5b4a-444c-b804-627b1e144577
# ╟─011edcbc-5af4-4a03-a35f-457c8490e6aa
# ╟─f601050c-f429-4c32-b51f-2ad851b7587a
# ╟─a1ab1557-f06c-448e-87d6-2236ef1040ad
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
