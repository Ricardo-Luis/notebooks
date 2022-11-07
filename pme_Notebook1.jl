### A Pluto.jl notebook ###
# v0.19.12

using Markdown
using InteractiveUtils

# ╔═╡ fa4e46d8-b3b0-451c-9a25-a36dfc5b1dfe
begin
	using PyCall   			 # chamar linguagem Python
	using PlutoUI 			 # user-interface do Pluto.jl
	using PlutoTeachingTools  # ferramentas de edição do notebook
end

# ╔═╡ eae7adb2-fe64-4495-9861-989d726ce2b4
ThreeColumn(md"`pme_Notebook1.jl`", md"[![](https://img.shields.io/badge/GitHub_URL-notebook-C09107)](https://github.com/Ricardo-Luis/notebooks/blob/main/PME/pme_Notebook1.jl)", md"`Last update: 03·10·2022`")

# ╔═╡ d80e7e6c-7d26-4b9c-a685-a83136a903ce
begin
	html"""
	<style>
		main {
			margin: auto;
			max-width: 1920px;
	    	padding-left: max(100px, 10%);
	    	padding-right: max(100px, 30%);
		}
	</style>
	"""
	ChooseDisplayMode()
end;

# ╔═╡ fa93319c-31c3-4a97-8e52-8d893cc54cdb
md"""
---
$\textbf{Utilização de notebook em PME}$

$\textbf{Exemplo de utilização para CAD paramétrico}$ 

$\textbf{Julia/Pluto utilização de comandos em Python para o FEMM}$
---
"""

# ╔═╡ 98fa8d3c-9632-4cd4-81a4-f4aa107faae6
md"""
# *Notebooks* em *Julia\Pluto*
"""

# ╔═╡ 5570fe10-a878-4686-8c70-bf40741fbafc
md"""
**_Pluto_** é uma interface para *notebook* baseada em navegador *web* (recomendado: Mozilla Firefox ou Google Chrome) para a linguagem de programação *Julia*. O **_Pluto_** permite criar um documento computacional (*notebook*) que combina parcelas de código *Julia* e os resultados computacionais com texto, expressões matemáticas, imagens, etc., de uma forma interligada e interactiva com o utilizador. 
"""

# ╔═╡ 95173c4c-176d-4790-b236-27de3dfe9cea
md"""
## Porquê *Julia*?  
"""

# ╔═╡ 581f1d64-29ee-4851-9330-fe3d4a98cad7
md"""
- linguagem de computação científica _open-source_ 
- fácil adopção, principalmente para quem conhece MATLAB: ver comparativo entre [MATLAB _vs._ Python _vs._ Julia](https://cheatsheets.quantecon.org/)
- artigo de opinião: [10 Reasons Why You Should Learn Julia](https://blog.goodaudience.com/10-reasons-why-you-should-learn-julia-d786ac29c6ca)
"""

# ╔═╡ 464d6e10-3cca-47b8-aa9b-64e24d1ca14f
md"""
## Porquê *Pluto*?  
"""

# ╔═╡ af9761e5-14fb-4cc0-9627-3b251a78da62
md"""

- Permite programação literária e reactiva: Fons van der Plas, Mikołaj Bochenski, [Interactive notebooks Pluto.jl](https://youtu.be/IAF8DjrQSSk), vídeo de apresentação do Pluto, conferência JuliaCon 2020. Duração: 24min.
- Fons van der Plas, [🎈 Pluto.jl — one year later](https://youtu.be/HiI4jgDyDhY), vídeo da conferência JuliaCon 2021. Duração: 27min.
- Connor Burns, [A Guide to Building Reactive Notebooks for Scientific Computing With Julia and Pluto.jl](https://medium.com/swlh/a-guide-to-building-reactive-notebooks-for-scientific-computing-with-julia-and-pluto-jl-1a2c0c455d51), artigo de opinião, Medium, Dec. 2020.
- os _notebooks_ criados no *Pluto* são ficheiros **_Julia_**, ou seja, os mesmos podem ser utilizados em editores de código ou em ambiente de desenvolvimento integrado (IDE) como Visual Studio, Atom...  
- permite fazer ciência reproduzível: \
![](https://i.imgur.com/shIpaY1.png) \
Fonte: Xing Su, "Reproducible Research Course Notes", Data Science Specialization, Johns Hopkins University, Fev. 2016.
"""

# ╔═╡ a2b16233-1a5a-47df-87b8-be8724d7a770
md"""
## Instalação do Julia e Pluto
"""

# ╔═╡ b649e7cf-3153-4929-a64e-2ca64de0eee7
md"""
Versão vídeo e versão escrita de instalação de Julia e Pluto: [First-time setup: Install Julia & Pluto](https://computationalthinking.mit.edu/Spring21/installation/)
"""

# ╔═╡ c86c0119-487c-429d-a7a8-1dc022c794ca
md"""
# FEMM 
"""

# ╔═╡ c255a6d2-e66e-41ef-bd9f-ca1f9e248122
md"""
## Exemplo de modelo com CAD paramétrico 
"""

# ╔═╡ d46b14ee-7185-42e1-b590-59f85ca9619f
md"""
**Objectivo**: desenhar um núcleo de transformador com a geometria da figura, mas de dimensões variáveis (CAD paramétrico). \
![](https://i.imgur.com/kyvAs6W.jpg)
"""

# ╔═╡ 937a7902-4553-46f5-8e25-3a438719a6a4
md"""
### Importação da biblioteca de comandos do FEMM a partir de *Python*
"""

# ╔═╡ 0adbd32d-c418-4272-a92c-976d6ae95de6
@pyimport femm as f

# ╔═╡ 83337f39-ac9a-49df-8028-5c31ac278fd3
md"""
### Definição de problema no FEMM
"""

# ╔═╡ 37cf28fc-618e-4694-a892-d3427a6f6339
md"""
### Parâmetros CAD
"""

# ╔═╡ a63683ea-29e2-4360-bcbd-0d8a8597e88a
begin
	low=44.1 			#outer legs width, mm
	lcw=42.5 			#center legs width, mm
	hc=111.6 			#half core height, mm
	tc=43.6 			#top/botton core height, mm
	ww=44.5 			#core window width, mm
	cl=2low+lcw+2ww 	#core lenght, mm
	wh=hc-tc 			#half core window height, mm
	cd=44.1 			#core deph, mm
end;

# ╔═╡ 10181196-8cfe-45ac-a1bb-bd58a6ca9b33
begin
	f.openfemm()
	f.newdocument(0)
	f.mi_setgrid(5,"cart")
    f.mi_probdef(0,"millimeters","planar",1.E-8,cd,30,0)
end

# ╔═╡ d30e9a75-d225-4a04-96a7-56b7f7802193
md"""
### Desenho do núcleo
"""

# ╔═╡ 4b90e489-0a38-4f6d-9c46-34f00595e125
begin
	#half core drawing
	f.mi_addnode(0,0)
	f.mi_addnode(low,0)
	f.mi_addnode(low,wh)
	f.mi_addnode(0,wh) #4
	f.mi_addnode(low,hc)
	f.mi_addnode(low+ww,wh)
	f.mi_addnode(low+ww,0)
	f.mi_addnode(low+ww+lcw,0)
	f.mi_addnode(low+ww+lcw,wh) #9
	f.mi_addnode(low+2ww+lcw,wh)
	f.mi_addnode(low+2ww+lcw,0)
	f.mi_addnode(2low+2ww+lcw,0)
	f.mi_addnode(2low+2ww+lcw,wh)
	f.mi_addnode(low+2ww+lcw,hc)
	f.mi_addsegment(0,0,low,0)
	f.mi_addsegment(low,0,low,wh)
	f.mi_addsegment(0,0,0,wh)
	f.mi_addsegment(low,wh,low+ww,wh)
	f.mi_addsegment(low+ww,wh,low+ww,0)  #5
	f.mi_addsegment(low+ww,0,low+ww+lcw,0)
	f.mi_addsegment(low+ww+lcw,0,low+ww+lcw,wh)
	f.mi_addsegment(low+ww+lcw,wh,low+2ww+lcw,wh)
	f.mi_addsegment(low+2ww+lcw,wh,low+2ww+lcw,0)
	f.mi_addsegment(low+2ww+lcw,0,2low+2ww+lcw,0)
	f.mi_addsegment(2low+2ww+lcw,0,2low+2ww+lcw,wh)
	f.mi_addsegment(low,hc,low+2ww+lcw,hc)
	f.mi_addarc(low,hc,0,wh,90,1)
	f.mi_addarc(2low+2ww+lcw,wh,low+2ww+lcw,hc,90,1)
	#2nd half core:
	f.mi_seteditmode("group")
	f.mi_selectgroup(0)
	f.mi_mirror(0,0,2low+2ww+lcw,0)
	f.mi_selectgroup(0)
	f.mi_setgroup(1)
	f.mi_clearselected()
end	

# ╔═╡ 9057bc6b-56fb-4ea2-82b3-2603a06e6dca
md"""
### *zoom ; save as, mesh*
"""

# ╔═╡ 1d8380bd-e958-4352-978e-9f9688d2ab93
begin
	f.mi_zoomnatural()
	f.mi_saveas("1phShell.fem")
	f.mi_createmesh()
end;

# ╔═╡ ae36a7f8-6347-4f11-ad47-6c8e4dbf62b4
md"""
### Adicionar materiais
"""

# ╔═╡ d0451715-efdf-4418-bbdc-194e8106f324
begin
	Cduct=10
	Lam_thck=0.025
	f.mi_addmaterial("Metglas2605SA1.025mm", 1, 1, 0, 0, Cduct, Lam_thck, 0, 0.98, 0, 0, 0, 0, 0);
    f.mi_addbhpoint("Metglas2605SA1.025mm",0.0,0.0)
	f.mi_addbhpoint("Metglas2605SA1.025mm",0.111,0.5)
	f.mi_addbhpoint("Metglas2605SA1.025mm",0.259,0.9)
	f.mi_addbhpoint("Metglas2605SA1.025mm",0.424,1.3)
	f.mi_addbhpoint("Metglas2605SA1.025mm",0.576,1.6)
    f.mi_addbhpoint("Metglas2605SA1.025mm",0.689,1.8)
	f.mi_addbhpoint("Metglas2605SA1.025mm",0.758,1.9)
	f.mi_addbhpoint("Metglas2605SA1.025mm",0.858,2.0)
	f.mi_addbhpoint("Metglas2605SA1.025mm",0.915,2.1)
	f.mi_addbhpoint("Metglas2605SA1.025mm",0.959,2.2)
	f.mi_addbhpoint("Metglas2605SA1.025mm",1.059,2.4)
	f.mi_addbhpoint("Metglas2605SA1.025mm",1.110,2.5)
	f.mi_addbhpoint("Metglas2605SA1.025mm",1.148,2.7)
	f.mi_addbhpoint("Metglas2605SA1.025mm",1.185,3.0)
	f.mi_addbhpoint("Metglas2605SA1.025mm",1.219,3.3)
	f.mi_addbhpoint("Metglas2605SA1.025mm",1.251,3.6)
	f.mi_addbhpoint("Metglas2605SA1.025mm",1.292,4.3)
	f.mi_addbhpoint("Metglas2605SA1.025mm",1.321,5.0)
	f.mi_addbhpoint("Metglas2605SA1.025mm",1.350,5.8)
	f.mi_addbhpoint("Metglas2605SA1.025mm",1.387,7.4)
	f.mi_addbhpoint("Metglas2605SA1.025mm",1.387,7.4)
	f.mi_addbhpoint("Metglas2605SA1.025mm",1.415,10.1)
	f.mi_addbhpoint("Metglas2605SA1.025mm",1.442,22.0)
	f.mi_addbhpoint("Metglas2605SA1.025mm",1.449,33.4)
end

# ╔═╡ 035137fa-e80c-4ad8-8173-220394a5b481
f.mi_saveas("1phShell.fem")

# ╔═╡ bda74f3c-8871-49d7-b79f-359ec8522e1d
md"""
.\
.\
.\
... este projecto há-de continuar!
"""

# ╔═╡ 92d9cb7e-4126-48bb-9f8f-b618b5a2b5a0


# ╔═╡ ccf8217f-3a9c-43e1-bde8-536a14710c13
md"""
# *Notebook*
"""

# ╔═╡ 2eab9c6c-07e6-4b45-a5a7-7be993a74e7c
md"""
Documentação das bibliotecas Julia utilizadas:  [PyCall](https://github.com/JuliaPy/PyCall.jl), [PlutoUI](https://juliahub.com/docs/PlutoUI/abXFp/0.7.6/), [PlutoTeachingTools](https://github.com/JuliaPluto/PlutoTeachingTools.jl).
"""

# ╔═╡ f49ecfdc-ca4a-402f-a3e5-0ea541e8b365
md"""
O *package* **PyCall** serve para chamar instruções de programação *Python*, por conseguinte, é necessário ter previamente [*Python*](https://www.python.org/downloads/) instalado.
"""

# ╔═╡ 45ed105b-9ea8-44b7-bc38-5a60b781f6d1
begin
	# other stuff:
	isel_logo="https://www.isel.pt/sites/default/files/NoPath%20-%20Copy%402x_0.png"
	julia_logo="https://github.com/JuliaLang/julia-logo-graphics/blob/master/images/julia-logo-color.png?raw=true"
	version=VERSION
end;

# ╔═╡ 2f0c93e3-1a77-4351-9202-6f6abdeaad1b
TwoColumnWideRight(md"$(Resource(isel_logo, :height => 95))", md"
$\textbf{\color{green}{Master in Electrical Engineering}}$ 
$\text{Electrical Machines Design}$")

# ╔═╡ db01969f-7cc7-4813-a92a-509d597e0d6b
md"""
*Notebook* realizado em linguagem de computação científica Julia versão $(version).

**_Time to first plot_**: até cerca de 50 seg.

**Computador**: Intel® Core™ i5-6300U CPU @ 2.40GHz; 20GB RAM.
"""

# ╔═╡ 84fa4ec0-7685-4655-afc2-cc01acd4dc39
TableOfContents(title="Índice")

# ╔═╡ 000bb2ad-9134-40ef-8e19-071bb4489c38
md"""
---
"""

# ╔═╡ 296cce2e-1e2d-41a0-90aa-5457688d331c
ThreeColumn(md"Text content: [![](https://i.creativecommons.org/l/by-sa/4.0/80x15.png)](http://creativecommons.org/licenses/by-sa/4.0/)", md" $(Resource(julia_logo, :height => 15)) `code`: [`MIT License`](https://www.tldrlegal.com/l/mit)", md"[$$© \text{ 2022 Ricardo Luís}$$](https://ricardo-luis.github.io/me2/)")

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoTeachingTools = "661c6b06-c737-4d37-b85c-46df65de6f69"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
PyCall = "438e738f-606a-5dbb-bf0a-cddfbfd45ab0"

[compat]
PlutoTeachingTools = "~0.2.3"
PlutoUI = "~0.7.43"
PyCall = "~1.94.1"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.0"
manifest_format = "2.0"
project_hash = "a72d1cd929dc8ee8fd397092b01eb90e8fa8417f"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.CodeTracking]]
deps = ["InteractiveUtils", "UUIDs"]
git-tree-sha1 = "1833bda4a027f4b2a1c984baddcf755d77266818"
uuid = "da1fd8a2-8d9e-5ec2-8556-3022fb5608a2"
version = "1.1.0"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "0.5.2+0"

[[deps.Conda]]
deps = ["Downloads", "JSON", "VersionParsing"]
git-tree-sha1 = "6e47d11ea2776bc5627421d59cdcc1296c058071"
uuid = "8f4d0f93-b110-5947-807f-2305c1781a2d"
version = "1.7.0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Formatting]]
deps = ["Printf"]
git-tree-sha1 = "8339d61043228fdd3eb658d86c926cb282ae72a8"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.2"

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

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[deps.JuliaInterpreter]]
deps = ["CodeTracking", "InteractiveUtils", "Random", "UUIDs"]
git-tree-sha1 = "0f960b1404abb0b244c1ece579a0ec78d056a5d1"
uuid = "aa1ae85d-cabe-5617-a682-6adf51b2e16a"
version = "0.9.15"

[[deps.LaTeXStrings]]
git-tree-sha1 = "f2355693d6778a178ade15952b7ac47a4ff97996"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.3.0"

[[deps.Latexify]]
deps = ["Formatting", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "OrderedCollections", "Printf", "Requires"]
git-tree-sha1 = "ab9aa169d2160129beb241cb2750ca499b4e90e9"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.15.17"

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

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.LoweredCodeUtils]]
deps = ["JuliaInterpreter"]
git-tree-sha1 = "dedbebe234e06e1ddad435f5c6f4b85cd8ce55f7"
uuid = "6f1432cf-f94c-5a45-995e-cdbf5db27b0b"
version = "2.2.2"

[[deps.MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "3d3e902b31198a27340d0bf00d6ac452866021cf"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.9"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.0+0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.2.1"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.20+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "3d5bf43e3e8b412656404ed9466f1dcbf7c50269"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.4.0"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.8.0"

[[deps.PlutoHooks]]
deps = ["InteractiveUtils", "Markdown", "UUIDs"]
git-tree-sha1 = "072cdf20c9b0507fdd977d7d246d90030609674b"
uuid = "0ff47ea0-7a50-410d-8455-4348d5de0774"
version = "0.0.5"

[[deps.PlutoLinks]]
deps = ["FileWatching", "InteractiveUtils", "Markdown", "PlutoHooks", "Revise", "UUIDs"]
git-tree-sha1 = "0e8bcc235ec8367a8e9648d48325ff00e4b0a545"
uuid = "0ff47ea0-7a50-410d-8455-4348d5de0420"
version = "0.1.5"

[[deps.PlutoTeachingTools]]
deps = ["Downloads", "HypertextLiteral", "LaTeXStrings", "Latexify", "Markdown", "PlutoLinks", "PlutoUI", "Random"]
git-tree-sha1 = "d8be3432505c2febcea02f44e5f4396fae017503"
uuid = "661c6b06-c737-4d37-b85c-46df65de6f69"
version = "0.2.3"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "2777a5c2c91b3145f5aa75b61bb4c2eb38797136"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.43"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.PyCall]]
deps = ["Conda", "Dates", "Libdl", "LinearAlgebra", "MacroTools", "Serialization", "VersionParsing"]
git-tree-sha1 = "53b8b07b721b77144a0fbbbc2675222ebf40a02d"
uuid = "438e738f-606a-5dbb-bf0a-cddfbfd45ab0"
version = "1.94.1"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[deps.Revise]]
deps = ["CodeTracking", "Distributed", "FileWatching", "JuliaInterpreter", "LibGit2", "LoweredCodeUtils", "OrderedCollections", "Pkg", "REPL", "Requires", "UUIDs", "Unicode"]
git-tree-sha1 = "dad726963ecea2d8a81e26286f625aee09a91b7c"
uuid = "295af30f-e4ad-537b-8983-00126c2a3abe"
version = "3.4.0"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.0"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.Tricks]]
git-tree-sha1 = "6bac775f2d42a611cdfcd1fb217ee719630c4175"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.6"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.VersionParsing]]
git-tree-sha1 = "58d6e80b4ee071f5efd07fda82cb9fbe17200868"
uuid = "81def892-9a0e-5fdd-b105-ffc91e053289"
version = "1.3.0"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.12+3"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.1.1+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.48.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+0"
"""

# ╔═╡ Cell order:
# ╟─eae7adb2-fe64-4495-9861-989d726ce2b4
# ╟─d80e7e6c-7d26-4b9c-a685-a83136a903ce
# ╟─2f0c93e3-1a77-4351-9202-6f6abdeaad1b
# ╟─fa93319c-31c3-4a97-8e52-8d893cc54cdb
# ╟─98fa8d3c-9632-4cd4-81a4-f4aa107faae6
# ╟─5570fe10-a878-4686-8c70-bf40741fbafc
# ╟─95173c4c-176d-4790-b236-27de3dfe9cea
# ╟─581f1d64-29ee-4851-9330-fe3d4a98cad7
# ╟─464d6e10-3cca-47b8-aa9b-64e24d1ca14f
# ╟─af9761e5-14fb-4cc0-9627-3b251a78da62
# ╟─a2b16233-1a5a-47df-87b8-be8724d7a770
# ╟─b649e7cf-3153-4929-a64e-2ca64de0eee7
# ╟─c86c0119-487c-429d-a7a8-1dc022c794ca
# ╟─c255a6d2-e66e-41ef-bd9f-ca1f9e248122
# ╟─d46b14ee-7185-42e1-b590-59f85ca9619f
# ╟─937a7902-4553-46f5-8e25-3a438719a6a4
# ╠═0adbd32d-c418-4272-a92c-976d6ae95de6
# ╟─83337f39-ac9a-49df-8028-5c31ac278fd3
# ╠═10181196-8cfe-45ac-a1bb-bd58a6ca9b33
# ╟─37cf28fc-618e-4694-a892-d3427a6f6339
# ╠═a63683ea-29e2-4360-bcbd-0d8a8597e88a
# ╟─d30e9a75-d225-4a04-96a7-56b7f7802193
# ╠═4b90e489-0a38-4f6d-9c46-34f00595e125
# ╟─9057bc6b-56fb-4ea2-82b3-2603a06e6dca
# ╠═1d8380bd-e958-4352-978e-9f9688d2ab93
# ╟─ae36a7f8-6347-4f11-ad47-6c8e4dbf62b4
# ╠═d0451715-efdf-4418-bbdc-194e8106f324
# ╠═035137fa-e80c-4ad8-8173-220394a5b481
# ╟─bda74f3c-8871-49d7-b79f-359ec8522e1d
# ╟─92d9cb7e-4126-48bb-9f8f-b618b5a2b5a0
# ╟─ccf8217f-3a9c-43e1-bde8-536a14710c13
# ╟─2eab9c6c-07e6-4b45-a5a7-7be993a74e7c
# ╠═fa4e46d8-b3b0-451c-9a25-a36dfc5b1dfe
# ╟─f49ecfdc-ca4a-402f-a3e5-0ea541e8b365
# ╟─45ed105b-9ea8-44b7-bc38-5a60b781f6d1
# ╟─db01969f-7cc7-4813-a92a-509d597e0d6b
# ╠═84fa4ec0-7685-4655-afc2-cc01acd4dc39
# ╟─000bb2ad-9134-40ef-8e19-071bb4489c38
# ╟─296cce2e-1e2d-41a0-90aa-5457688d331c
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
