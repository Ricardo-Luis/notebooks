### A Pluto.jl notebook ###
# v0.19.11

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

# ╔═╡ a99eb837-a18d-4a4c-a4d3-756cc2e6b1de
begin
	using PlutoUI, PlutoTeachingTools # interface, ferramentas de edição
	using Plots							# gráficos
	using Dierckx 						# interpolação de dados
end

# ╔═╡ 1f9f4012-1be5-42a4-8d56-949d783e6518
ThreeColumn(md"`Separ.Shunt.GEN.Ex2.jl`", md"[![](https://img.shields.io/badge/GitHub_URL-notebook-C09107)](https://github.com/Ricardo-Luis/notebooks/blob/main/ME2/Separ.Shunt.GEN.Ex2.jl)", md"`Last update: 27·09·2022`")

# ╔═╡ 5277a02b-2fd9-49b6-958f-3c6d53d3e433
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

# ╔═╡ 9a4e9d24-3fd0-405f-adc3-4afc509629ef
md"""
---
$\textbf{MÁQUINAS ELÉTRICAS DE CORRENTE CONTÍNUA}$

$\text{EXERCÍCIO 2}$ 

$\textbf{Gerador de excitação separada (ou independente)}$
$\textbf{e}$
$\textbf{Gerador de excitação em derivação (ou gerador \textit{shunt})}$
---
"""

# ╔═╡ 75ecba91-0134-4ebe-8c7d-683a75b86137
md"""
# Exercício 2. Dados:
"""

# ╔═╡ f33dd982-062c-4369-ac89-4b4a6e2d231c
md"""
**Um gerador de corrente contínua $$[220\rm{V}, 12A, 1500rpm]$$ com excitação independente foi ensaiado em vazio e em carga, à velocidade nominal, tendo-se obtido as seguintes características:**
"""

# ╔═╡ 1ea689c9-8cac-4045-b7e7-6ca0cf228b10
md"""
Característica magnética: $$E_{0} =f(I_{exc})$$ 
com   $$n=constante$$
"""

# ╔═╡ 4354f1c7-0bcd-41d5-b561-94d39882390d
begin
	Iexc = [0.0, 0.25, 0.5, 0.75, 1.0, 1.5]
	E₀_1500 = [20.0, 180.0, 238.0, 270.0, 284.0, 300.0]
	Iexc, E₀_1500	
end

# ╔═╡ 020231d4-c99c-43d4-b835-34450dadcf09
md"""
Característica externa: $U =f(I)$ 
com   $n$ e $R_{c}=\rm constantes$
"""

# ╔═╡ bdc9dc1f-3a77-4588-8dba-f53ffd0da995
begin
	I = [0.0, 5.0, 10.0, 15.0, 20.0]
	U = [278.0, 260.0, 242.0, 216.0, 186.0]
	I, U	
end

# ╔═╡ 33309480-de5b-48d8-8108-d4c349d3b540


# ╔═╡ 76cdc663-19dc-4a1e-8550-1d4a23ba7d18
md"""
# a) Excitação separada
**Determine a queda de tensão interna total deste gerador.**
"""

# ╔═╡ 0d29d92b-41ba-4c90-b4fd-810402788e9f
md"""
A tensão de vazio, $$U_{0}$$, depende da força eletromotriz (FEM), $E_0$, sendo controlado pelo reóstato de campo do circuito de excitação independente, ou seja:
$$U_{0}=E_{0}=$$ $(U[1,1])V 
"""

# ╔═╡ a7bbd43a-a1a3-40f2-a01a-48e6dbd2a302
md"""
Queda de tensão total, $\Delta U_{t}$, é dada por: 

$$\Delta U_{t}=E_{0}-U$$

com $$E_{0}$$ constante (não depende da corrente de carga).
"""

# ╔═╡ c6edc3fc-22ac-4d59-bd8a-edcb6ee1e6a5
ΔUₜ = U[1,1] .- U[:,1]

# ╔═╡ 1055c56d-8ac7-4b3c-882d-d754dfa13a6e


# ╔═╡ 216516fa-f937-42ce-b4dd-d4890753ba77
md"""
!!! nota
	## Obter família de curvas 💻
	- Com base numa $$E₀ =f(Iexc)$$ pode-se obter uma **família de características magnéticas**, em função da velocidade de acionamento do gerador;
	- Com base numa $$U =f(I)$$ pode-se obter uma **família de características externas**, em função da corrente de campo e da velocidade de acionamento do gerador.
"""

# ╔═╡ c5f95082-b8a6-45e7-a838-4ee9483b76d3
md"""
Tendo em consideração a expressão da FEM, $E_0$:

$E_0=k\phi_0n$

Podemos relacionar a FEM para diferentes velocidades. Assim, para a característica magnética, tem-se:

$E_0(n_{mag}) = k\phi_0n_{mag}$

Sendo, $n_{mag}$, a velocidade a que foi obtida a característica magnética. 

Para qualquer outra velocidade, fica:

$E_0(n) = k\phi_0n$

Combinando as expressões de $E_0(n_{mag})$ e $E_0(n)$, tem-se:

$\frac{E_0(n_{mag})}{E_0(n)} = \frac{k\phi_0n_{mag}}{k\phi_0n}$

O fluxo magnético em vazio, $k\phi_0$, é independente da velocidade, variando somente com a corrente de excitação, $I_{ex}$. Assim com: 

 $k\phi_0 = \textbf{constante}$, para cada valor de $I_{ex}$, resulta:

$E_0(n) = \frac{n}{n_{mag}} E_0(n_{mag})$

Assim, pode-se relacionar as FEM e obter curvas de $E_0 = f(I_{ex})$ a diferentes velocidades, a partir da característica magnética obtida no ensaio em vazio.

"""

# ╔═╡ 84177121-0d8d-4d90-a3ac-48add3561563
md"""
> 👉 Teste a variação da FEM com a velocidade, a partir do *slider* "Velocidade":
"""

# ╔═╡ dd2e5088-71bb-4e3b-8045-7d5b9eaf3861
"Velocidade, rpm", @bind rpm PlutoUI.Slider(500:10:2000, default=1500, show_value=true)

# ╔═╡ 46ae39af-c0ad-4c8f-80ae-c830946ca5ce
E₀ₙ = round.((rpm/1500) .* E₀_1500, digits=1)

# ╔═╡ 655f4216-bad9-4a90-9fac-a8439bdbdeba
md"""
> Forma computacional para consultar o valor da corrente de campo para uma dada FEM, por interpolação: 
"""

# ╔═╡ ede13ff1-533e-4916-90b8-54a0288188d7
#utilizando pkg Dierckx.jl
begin
	Spl_Iexc = Spline1D(E₀_1500,Iexc)
	Id00 = Spl_Iexc(U[1,1])
	Id00 = round(Id00, digits=2)
end

# ╔═╡ 628ddb1e-e6eb-43c4-b1a1-760431a5be88
md"""
> Forma computacional para consultar o valor da FEM à velocidade $$n$$, para uma dada corrente de campo, por interpolação:
"""

# ╔═╡ 46cffa11-842e-4781-a291-f6fe4bd76ec6
md"""
> 👉 Teste o efeito da variação da corrente de excitação, $I_{ex}$, do gerador de excitação separada, no valor da tensão de vazio, $U_0$, e sobre a característica a característica externa:
"""

# ╔═╡ 83386f45-c442-44dd-82f4-2c6909b0e1ef
"Iexc, A (circuito de exc. separada)", @bind Icampo PlutoUI.Slider(0:0.01:1.5, default=Id00, show_value=true)

# ╔═╡ 4013e8e0-34b4-4ad4-8e12-cd827d8cef71
#utilizando pkg Dierckx.jl
begin
	Spl_E₀ₙ = Spline1D(Iexc,E₀ₙ)
	E₀exx = Spl_E₀ₙ(Icampo)
	E₀exx = round(E₀exx, digits=2)
end;

# ╔═╡ 4135fa9e-37f7-461d-a064-c08c892bf0e4
"Rcarga, Ω", @bind Rcarga PlutoUI.Slider(1:1:1000, default=20, show_value=true)

# ╔═╡ 483480d6-427d-4f1f-9622-3cd267ac2aee
begin
	Uspeed=E₀exx.-ΔUₜ
	P1=plot(I,Uspeed, title="U=f(I)", xlabel = "I(A)", ylabel="U(V)", 
			ylims=(0,420), xlims=(0,20), lw=3, label="U=f(I)")
	
	plot!(I, Rcarga*I, xlims=(0,20),ylims=(0,400), 
			linestyle=:dash, label="Reta de Carga=$(Rcarga)Ω", legend=:best)
	
	plot!(I,ΔUₜ, label="ΔUₜ", linecolor=:black)
	
	plot!([E₀exx], seriestype = :hline, linecolor=:green, 
			label="E₀=f(I) => constante, U₀=$(round(E₀exx))V", legend=:topleft)
	
	P2=plot(Iexc,E₀ₙ,title="E₀=f(Iₑₓ), n=$(rpm)rpm", xflip=false, ylims=(0,400), 
			xlabel = "Iₑₓ(A)", ylabel="E₀(V)", xlims=(0,1.5), lw=2, label=false)
	
	plot!([Icampo], seriestype = :vline, linecolor=:green,linestyle=:dash, 
			xlims=(0,1.5),ylims=(0,400), label="ponto de excitação=$(Icampo)A", legend=:bottomright)
	
	plot!([E₀exx], seriestype = :hline, linecolor=:green, linestyle=:dash, 
			xlims=(0,1.5),ylims=(0,400), label=:none, legend=:bottomright)
	
	plot(P2, P1, layout = (1, 2))
end

# ╔═╡ f7a52930-8df8-4460-a942-c6bbf3ff5283
md"""
> 👉 Arraste o *slider* "Velocidade" para junto das curvas características do gerador de excitação separada e observe o efeito da variação da velocidade sobre as mesmas.
"""

# ╔═╡ a7ff7d1a-3cc0-4169-b955-c3e4284b478b


# ╔═╡ 88d250ff-0f4a-404c-b6dd-f977afd58033
md"""
# b) Excitação derivação
**O que é a resistência crítica de um gerador com uma excitação derivação? Qual a sua importância? Como se determina (aproximadamente) na prática?**
"""

# ╔═╡ 43c2b9bd-cbdc-43de-bf8c-f0cfec8f438f
md"""
A resistência crítica serve para determinar o valor máximo de resistência de um circuito de excitação e consequentemente dimensionar o valor máximo do reostato de campo. Pode ser determinada aproximadamente pelo 1º par de valores não nulos da característica magnética.
"""

# ╔═╡ 3d90d0d1-7364-45f4-a8b2-c129b01acc6f
Rcrítica = E₀_1500[2,1]/Iexc[2,1]

# ╔═╡ 7b3693dc-5e73-48a2-b3c1-25a1acb65d9d
begin
	plot(Iexc,E₀_1500,title="E₀=f(Iₑₓ), n=1500rpm", xflip=false, ylims=(0,400), xlabel = "Iₑₓ(A)", ylabel="E₀(V)", xlims=(0,1.5), label=false)
	plot!(Iexc,E₀_1500.-E₀_1500[1,1], label="E₀-E₀ᵣₑₘ")
	plot!(Iexc,Rcrítica.*Iexc,label="Rcrítica")
end

# ╔═╡ 1f4f7952-3a04-48a5-b016-811340d4d5b5


# ╔═╡ ec518b39-8f04-433a-88dc-589d802a8764
md"""
# c) Circuito de excitação
**Qual a resistência do enrolamento indutor, sabendo que como gerador derivação, à velocidade nominal, sem resistência de campo, $$U_0=294\rm{V}$$.**
"""

# ╔═╡ d2d7a521-3c6c-4835-8fd9-ada41a3fa84a
md"""
A reta de excitação, $$U=R_{ex}I_d$$, determina o valor da tensão em vazio $$U_0$$ no ponto de intersecção com a característica magnética. Por conseguinte, não havendo reóstato de campo, $$R_c=0Ω$$, a resistência do circuito de excitação, $$R_{ex}=R_c+R_d$$, corresponde apenas à resistência do enrolamento indutor, $$R_d$$.
"""

# ╔═╡ 8974954c-afb3-4238-bcb3-4c7027af62e1
begin
		Id_294=round(Spl_Iexc(294), digits=2)
		Rd=round(294/Id_294, digits=1)
end;

# ╔═╡ a2dff0a0-4d68-49dd-86fd-8236795b3f44
md"""
Assim, em dois passos determina-se o valor de $$R_{ex}=R_d$$:
- consultar a característica magnética para obter a corrente de campo correspondente a $$U_0=294$$V;
- cálculo da resistência do circuito de excitação
Obtém-se, $$R_d=$$ $(Rd)Ω
"""

# ╔═╡ 99e21df1-559f-4e73-933e-5561205ed3f5


# ╔═╡ feca6cc5-514f-423d-8a88-68ebf7a139b4
md"""
# d) $$U =f(I)$$ com ⇅ do $$R_c$$ 💻
**Explicite qualitativamente qual a influência que a variação da resistência de campo tem, sobre a característica externa do gerador derivação. Justifique sucintamente.**
"""

# ╔═╡ 6f5c99d9-e601-40db-b84a-0ad3d4f1cc26
"Rexc (circuito exc. derivação), Ω", @bind Rexc PlutoUI.Slider(300/1.5:1:Rcrítica, default=356, show_value=true) #default=278/Id00

# ╔═╡ 1c525022-003b-45ab-9e89-ace963c2ae78
# Determinação computacional da U=f(I), ligando os sucessivos valores de ΔUₜ(Id) com ΔUₜ(I):
begin
	# interpolação dos valores de E₀ₙ para valores de Id
	j = 0.001
	id = 0:j:1.5
	E₀shunt = Spline1D(Iexc,E₀ₙ)
	E₀_shunt = E₀shunt(id)

	#ΔUₜ(Id) = E₀(Id) - Rexc Id
	ΔUₜ_exc = E₀_shunt - Rexc .* id
	
	# selecção dos valores positivos de ΔUₜ(Id)
	ΔUₜ_exc = ΔUₜ_exc[ΔUₜ_exc .>= 0]
	
	# interpolação dos valores de I (carga) na curva ΔUₜ(I), para os valores de ΔUₜ(Id) encontrados
	Ishunt = Spline1D(ΔUₜ,I)
	I_shunt = Ishunt(ΔUₜ_exc)
end;

# ╔═╡ 032831d9-8167-4039-a5ac-f088cc9efc21
begin
	ii = count(i->(i>= 0), ΔUₜ_exc)
	id_ii = 0:j:((ii-1)*j)
	Ud=Rexc.*id_ii
	I_shunt, id_ii, Ud, ΔUₜ_exc
	
	P3=plot(I_shunt,Ud, 
			title="Característica externa", xlabel = "I(A)", ylabel="U(V)", 
			ylims=(0,400), xlims=(0,30), label=false,linewidth=2)
	
	plot!(I, Rcarga.*I, label="Reta de Carga", legend=:topright)
	
	plot!(I_shunt, ΔUₜ_exc, label="ΔUₜ", legend=:topright)
	
	P4=plot(Iexc,E₀ₙ,
			title="Característica vazio", xlabel = "Id(A)", ylabel="U₀(V)", 
			ylims=(0,400), xlims=(0,1.5), label=false, linewidth=2, xflip=true)
	
	plot!(id, Rexc.*id, xlims=(0,1.5),ylims=(0,400), 
			label="Reta de excitação", legend=:topright)
	
	plot(P4, P3, layout = (1, 2))
end

# ╔═╡ 6d6d84cd-9fa1-4b9c-8146-730fe420fc74
md"""
!!! nota
	👉 Arraste os *sliders* "Velocidade" e "Rcarga" para junto das curvas características do gerador *shunt*.

	## $$U =f(I)$$ com ⇅ da $$n$$ 💻
	**Observe o comportamento da característica externa do gerador derivação, $$U =f(I)$$, para diferentes valores de velocidade de acionamento, $$n$$ , e reóstato de campo constante, $$R_c=constante$$. \
	Compare as características externas deste gerador de corrente contínua, com excitação *shunt* e com excitação separada.**
"""

# ╔═╡ ed07e275-7ff6-4c9e-8a26-7dfcd79d7abe


# ╔═╡ 85234e93-01fe-47d8-be53-ef84f7cde6a9
md"""
# e) Alteração de U₀ sem Rc
**Nas condições de excitação da alínea c), como proceder para obter uma tensão de vazio de $$336\rm{V}$$.**
"""

# ╔═╡ c101ce8d-3da8-4836-a6aa-97cae52e7552
begin
	U₀ = 336
	# Cálculo de Id
	Id = U₀/Rd
	Id = round(Id, digits=1)

	# Retirar o valor de E₀ para o valor de Id calculado na característica magnética a 1500rpm (modo computacional, por interpolação)
	Spl_E₀ = Spline1D(Iexc,E₀_1500)
	E₀_Id = Spl_E₀(Id)
	E₀_Id = round(E₀_Id, digits=1)
	
	# Cálculo de Kϕ
	Kϕ = E₀_Id/1500

	# Cálculo da velocidade,rpm
	n = U₀/Kϕ
	n = round(n, digits=1)

	# mostrar sequência de resultados
	Id, E₀_Id, Kϕ, n  		
end

# ╔═╡ d62dc9fb-62f2-4503-8643-4aeeff617202
md"""
Não havendo reóstato de campo, apenas é possível ajustar de tensão de vazio através da velocidade de acionamento.  
Calculando, obtém-se: $$n=$$ $(n) rpm
"""

# ╔═╡ e2eca547-4db1-4a6b-97ab-325e7be0a745


# ╔═╡ e44e9399-4830-41a1-b3b4-95c5bb0ef24d
md"""
# *Notebook*
"""

# ╔═╡ 2257a478-ed9b-4a7b-9dcc-5a29d7435990
md"""
Documentação das bibliotecas Julia utilizadas:  [Dierckx](https://github.com/kbarbary/Dierckx.jl), [Plots](http://docs.juliaplots.org/latest/), [PlutoUI](https://juliahub.com/docs/PlutoUI/abXFp/0.7.6/).
"""

# ╔═╡ 6e11f240-f4a2-417b-aec5-e7c1cd5ee87f
begin
	# other stuff:
	isel_logo="https://www.isel.pt/sites/default/files/NoPath%20-%20Copy%402x_0.png"
	julia_logo="https://github.com/JuliaLang/julia-logo-graphics/blob/master/images/julia-logo-color.png?raw=true"
	version=VERSION
end;

# ╔═╡ 499d94be-99d3-4da2-b5cf-794f94e851e2
ThreeColumn(md"$(Resource(isel_logo, :height => 75))", md"
$\textbf{\color{green}{Lic. em Engenharia Eletrotécnica }}$", md"$\text{ Máquinas Elétricas II}$")

# ╔═╡ a0bba541-aab2-4c45-83be-743d0e9dc9ee
md"""
*Notebook* realizado em linguagem de computação científica Julia versão $(version).

**_Time to first plot_**: até cerca de 1.4 min.

**Computador**: Intel® Core™ i5-6300U CPU @ 2.40GHz; 20GB RAM.
"""

# ╔═╡ 4ab2ae32-7315-4867-9b9a-021a7bfb9e49
md"""
!!! info
	No índice deste *notebook*, os tópicos assinalados com "💻" requerem a participação do estudante.
"""

# ╔═╡ 9ad6bdff-e6b8-49b8-aef2-becc8e3898cc
TableOfContents(title="Índice")

# ╔═╡ 721e3e66-f198-43d3-acc4-a14164e1e29c
md"""
---
"""

# ╔═╡ b176721c-6a68-4041-b1a7-cbb7122d4af5
ThreeColumn(md"Text content: [![](https://i.creativecommons.org/l/by-sa/4.0/80x15.png)](http://creativecommons.org/licenses/by-sa/4.0/)", md" $(Resource(julia_logo, :height => 15)) `code`: [`MIT License`](https://www.tldrlegal.com/l/mit)", md"[$$© \text{ 2022 Ricardo Luís}$$](https://ricardo-luis.github.io/me2/)")

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Dierckx = "39dd38d3-220a-591b-8e3c-4c3a8c710a94"
Plots = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
PlutoTeachingTools = "661c6b06-c737-4d37-b85c-46df65de6f69"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
Dierckx = "~0.5.2"
Plots = "~1.34.0"
PlutoTeachingTools = "~0.2.3"
PlutoUI = "~0.7.43"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.0"
manifest_format = "2.0"
project_hash = "ef8648f031bc2d3e778ace9ea566aa33d33dc51b"

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

[[deps.BitFlags]]
git-tree-sha1 = "84259bb6172806304b9101094a7cc4bc6f56dbc6"
uuid = "d1d4a3ce-64b1-5f1a-9ba4-7e7e69966f35"
version = "0.1.5"

[[deps.Bzip2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "19a35467a82e236ff51bc17a3a44b69ef35185a2"
uuid = "6e34b625-4abd-537c-b88f-471c36dfa7a0"
version = "1.0.8+0"

[[deps.Cairo_jll]]
deps = ["Artifacts", "Bzip2_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "JLLWrappers", "LZO_jll", "Libdl", "Pixman_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "4b859a208b2397a7a623a03449e4636bdb17bcf2"
uuid = "83423d85-b0ee-5818-9007-b63ccbeb887a"
version = "1.16.1+1"

[[deps.ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "e7ff6cadf743c098e08fca25c91103ee4303c9bb"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.15.6"

[[deps.ChangesOfVariables]]
deps = ["ChainRulesCore", "LinearAlgebra", "Test"]
git-tree-sha1 = "38f7a08f19d8810338d4f5085211c7dfa5d5bdd8"
uuid = "9e997f8a-9a97-42d5-a9f1-ce6bfc15e2c0"
version = "0.1.4"

[[deps.CodeTracking]]
deps = ["InteractiveUtils", "UUIDs"]
git-tree-sha1 = "1833bda4a027f4b2a1c984baddcf755d77266818"
uuid = "da1fd8a2-8d9e-5ec2-8556-3022fb5608a2"
version = "1.1.0"

[[deps.CodecZlib]]
deps = ["TranscodingStreams", "Zlib_jll"]
git-tree-sha1 = "ded953804d019afa9a3f98981d99b33e3db7b6da"
uuid = "944b1d66-785c-5afd-91f1-9de20f533193"
version = "0.7.0"

[[deps.ColorSchemes]]
deps = ["ColorTypes", "ColorVectorSpace", "Colors", "FixedPointNumbers", "Random"]
git-tree-sha1 = "1fd869cc3875b57347f7027521f561cf46d1fcd8"
uuid = "35d6a980-a343-548e-a6ea-1d62b119f2f4"
version = "3.19.0"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

[[deps.ColorVectorSpace]]
deps = ["ColorTypes", "FixedPointNumbers", "LinearAlgebra", "SpecialFunctions", "Statistics", "TensorCore"]
git-tree-sha1 = "d08c20eef1f2cbc6e60fd3612ac4340b89fea322"
uuid = "c3611d14-8923-5661-9e6a-0046d554d3a4"
version = "0.9.9"

[[deps.Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "417b0ed7b8b838aa6ca0a87aadf1bb9eb111ce40"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.12.8"

[[deps.Compat]]
deps = ["Dates", "LinearAlgebra", "UUIDs"]
git-tree-sha1 = "5856d3031cdb1f3b2b6340dfdc66b6d9a149a374"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.2.0"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "0.5.2+0"

[[deps.Contour]]
git-tree-sha1 = "d05d9e7b7aedff4e5b51a029dced05cfb6125781"
uuid = "d38c429a-6771-53c6-b99e-75d170b6e991"
version = "0.6.2"

[[deps.DataAPI]]
git-tree-sha1 = "1106fa7e1256b402a86a8e7b15c00c85036fef49"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.11.0"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "d1fff3a548102f48987a52a2e0d114fa97d730f0"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.13"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[deps.Dierckx]]
deps = ["Dierckx_jll"]
git-tree-sha1 = "633c119fcfddf61fb4c75d77ce3ebab552a44723"
uuid = "39dd38d3-220a-591b-8e3c-4c3a8c710a94"
version = "0.5.2"

[[deps.Dierckx_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "6596b96fe1caff3db36415eeb6e9d3b50bfe40ee"
uuid = "cd4c43a9-7502-52ba-aa6d-59fb2a88580b"
version = "0.1.0+0"

[[deps.Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[deps.DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "5158c2b41018c5f7eb1470d558127ac274eca0c9"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.9.1"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.Expat_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "bad72f730e9e91c08d9427d5e8db95478a3c323d"
uuid = "2e619515-83b5-522b-bb60-26c02a35a201"
version = "2.4.8+0"

[[deps.FFMPEG]]
deps = ["FFMPEG_jll"]
git-tree-sha1 = "b57e3acbe22f8484b4b5ff66a7499717fe1a9cc8"
uuid = "c87230d0-a227-11e9-1b43-d7ebe4e7570a"
version = "0.4.1"

[[deps.FFMPEG_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "JLLWrappers", "LAME_jll", "Libdl", "Ogg_jll", "OpenSSL_jll", "Opus_jll", "Pkg", "Zlib_jll", "libaom_jll", "libass_jll", "libfdk_aac_jll", "libvorbis_jll", "x264_jll", "x265_jll"]
git-tree-sha1 = "ccd479984c7838684b3ac204b716c89955c76623"
uuid = "b22a6f82-2f65-5046-a5b2-351ab43fb4e5"
version = "4.4.2+0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

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

[[deps.GLFW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libglvnd_jll", "Pkg", "Xorg_libXcursor_jll", "Xorg_libXi_jll", "Xorg_libXinerama_jll", "Xorg_libXrandr_jll"]
git-tree-sha1 = "d972031d28c8c8d9d7b41a536ad7bb0c2579caca"
uuid = "0656b61e-2033-5cc2-a64a-77c0f6c09b89"
version = "3.3.8+0"

[[deps.GR]]
deps = ["Base64", "DelimitedFiles", "GR_jll", "HTTP", "JSON", "Libdl", "LinearAlgebra", "Pkg", "Printf", "Random", "RelocatableFolders", "Serialization", "Sockets", "Test", "UUIDs"]
git-tree-sha1 = "0ac6f27e784059c68b987f42b909ade0bcfabe69"
uuid = "28b8d3ca-fb5f-59d9-8090-bfdbd6d07a71"
version = "0.68.0"

[[deps.GR_jll]]
deps = ["Artifacts", "Bzip2_jll", "Cairo_jll", "FFMPEG_jll", "Fontconfig_jll", "GLFW_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll", "Pixman_jll", "Pkg", "Qt5Base_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "0eb5ef6f270fb70c2d83ee3593f56d02ed6fc7ff"
uuid = "d2c73de3-f751-5644-a686-071e5b155ba9"
version = "0.68.0+0"

[[deps.Gettext_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "9b02998aba7bf074d14de89f9d37ca24a1a0b046"
uuid = "78b55507-aeef-58d4-861c-77aaff3498b1"
version = "0.21.0+0"

[[deps.Glib_jll]]
deps = ["Artifacts", "Gettext_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Libiconv_jll", "Libmount_jll", "PCRE_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "a32d672ac2c967f3deb8a81d828afc739c838a06"
uuid = "7746bdde-850d-59dc-9ae8-88ece973131d"
version = "2.68.3+2"

[[deps.Graphite2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "344bf40dcab1073aca04aa0df4fb092f920e4011"
uuid = "3b182d85-2403-5c21-9c21-1e1f0cc25472"
version = "1.3.14+0"

[[deps.Grisu]]
git-tree-sha1 = "53bb909d1151e57e2484c3d1b53e19552b887fb2"
uuid = "42e2da0e-8278-4e71-bc24-59509adca0fe"
version = "1.0.2"

[[deps.HTTP]]
deps = ["Base64", "CodecZlib", "Dates", "IniFile", "Logging", "LoggingExtras", "MbedTLS", "NetworkOptions", "OpenSSL", "Random", "SimpleBufferStream", "Sockets", "URIs", "UUIDs"]
git-tree-sha1 = "4abede886fcba15cd5fd041fef776b230d004cee"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "1.4.0"

[[deps.HarfBuzz_jll]]
deps = ["Artifacts", "Cairo_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "Graphite2_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg"]
git-tree-sha1 = "129acf094d168394e80ee1dc4bc06ec835e510a3"
uuid = "2e76f6c2-a576-52d4-95c1-20adfe4de566"
version = "2.8.1+1"

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

[[deps.IniFile]]
git-tree-sha1 = "f550e6e32074c939295eb5ea6de31849ac2c9625"
uuid = "83e8ac13-25f8-5344-8a64-a9f2b223428f"
version = "0.5.1"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.InverseFunctions]]
deps = ["Test"]
git-tree-sha1 = "b3364212fb5d870f724876ffcd34dd8ec6d98918"
uuid = "3587e190-3f89-42d0-90ee-14403ec27112"
version = "0.1.7"

[[deps.IrrationalConstants]]
git-tree-sha1 = "7fd44fd4ff43fc60815f8e764c0f352b83c49151"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.1.1"

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

[[deps.JpegTurbo_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b53380851c6e6664204efb2e62cd24fa5c47e4ba"
uuid = "aacddb02-875f-59d6-b918-886e6ef4fbf8"
version = "2.1.2+0"

[[deps.JuliaInterpreter]]
deps = ["CodeTracking", "InteractiveUtils", "Random", "UUIDs"]
git-tree-sha1 = "0f960b1404abb0b244c1ece579a0ec78d056a5d1"
uuid = "aa1ae85d-cabe-5617-a682-6adf51b2e16a"
version = "0.9.15"

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
git-tree-sha1 = "7739f837d6447403596a75d19ed01fd08d6f56bf"
uuid = "7e76a0d4-f3c7-5321-8279-8d96eeed0f29"
version = "1.3.0+3"

[[deps.Libgpg_error_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "c333716e46366857753e273ce6a69ee0945a6db9"
uuid = "7add5ba3-2f88-524e-9cd5-f83b8a55f7b8"
version = "1.42.0+0"

[[deps.Libiconv_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "42b62845d70a619f063a7da093d995ec8e15e778"
uuid = "94ce4f54-9a6c-5748-9c1c-f9c7231a4531"
version = "1.16.1+1"

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

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.LogExpFunctions]]
deps = ["ChainRulesCore", "ChangesOfVariables", "DocStringExtensions", "InverseFunctions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "94d9c52ca447e23eac0c0f074effbcd38830deb5"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.18"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.LoggingExtras]]
deps = ["Dates", "Logging"]
git-tree-sha1 = "5d4d2d9904227b8bd66386c1138cf4d5ffa826bf"
uuid = "e6f89c97-d47a-5376-807f-9c37f3926c36"
version = "0.4.9"

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

[[deps.MbedTLS]]
deps = ["Dates", "MbedTLS_jll", "MozillaCACerts_jll", "Random", "Sockets"]
git-tree-sha1 = "6872f9594ff273da6d13c7c1a1545d5a8c7d0c1c"
uuid = "739be429-bea8-5141-9913-cc70e7f3736d"
version = "1.1.6"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.0+0"

[[deps.Measures]]
git-tree-sha1 = "e498ddeee6f9fdb4551ce855a46f54dbd900245f"
uuid = "442fdcdd-2543-5da2-b0f3-8c86c306513e"
version = "0.3.1"

[[deps.Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "bf210ce90b6c9eed32d25dbcae1ebc565df2687f"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.0.2"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.2.1"

[[deps.NaNMath]]
deps = ["OpenLibm_jll"]
git-tree-sha1 = "a7c3d1da1189a1c2fe843a3bfa04d18d20eb3211"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "1.0.1"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

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
git-tree-sha1 = "fa44e6aa7dfb963746999ca8129c1ef2cf1c816b"
uuid = "4d8831e6-92b7-49fb-bdf8-b643e874388c"
version = "1.1.1"

[[deps.OpenSSL_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e60321e3f2616584ff98f0a4f18d98ae6f89bbb3"
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "1.1.17+0"

[[deps.OpenSpecFun_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "13652491f6856acfd2db29360e1bbcd4565d04f1"
uuid = "efe28fd5-8261-553b-a9e1-b2916fc3738e"
version = "0.5.5+0"

[[deps.Opus_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "51a08fb14ec28da2ec7a927c4337e4332c2a4720"
uuid = "91d4177d-7536-5919-b921-800302f37372"
version = "1.3.2+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[deps.PCRE_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b2a7af664e098055a7529ad1a900ded962bca488"
uuid = "2f80f16e-611a-54ab-bc61-aa92de5b98fc"
version = "8.44.0+0"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "3d5bf43e3e8b412656404ed9466f1dcbf7c50269"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.4.0"

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
git-tree-sha1 = "8162b2f8547bc23876edd0c5181b27702ae58dce"
uuid = "ccf2f8ad-2431-5c83-bf29-c5338b663b6a"
version = "3.0.0"

[[deps.PlotUtils]]
deps = ["ColorSchemes", "Colors", "Dates", "Printf", "Random", "Reexport", "SnoopPrecompile", "Statistics"]
git-tree-sha1 = "21303256d239f6b484977314674aef4bb1fe4420"
uuid = "995b91a9-d308-5afd-9ec6-746e21dbc043"
version = "1.3.1"

[[deps.Plots]]
deps = ["Base64", "Contour", "Dates", "Downloads", "FFMPEG", "FixedPointNumbers", "GR", "JLFzf", "JSON", "LaTeXStrings", "Latexify", "LinearAlgebra", "Measures", "NaNMath", "Pkg", "PlotThemes", "PlotUtils", "Printf", "REPL", "Random", "RecipesBase", "RecipesPipeline", "Reexport", "RelocatableFolders", "Requires", "Scratch", "Showoff", "SnoopPrecompile", "SparseArrays", "Statistics", "StatsBase", "UUIDs", "UnicodeFun", "Unzip"]
git-tree-sha1 = "6fae75c2178132582ea261d39f6da50cdd09c3c6"
uuid = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
version = "1.34.0"

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

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "47e5f437cc0e7ef2ce8406ce1e7e24d44915f88d"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.3.0"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.Qt5Base_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Fontconfig_jll", "Glib_jll", "JLLWrappers", "Libdl", "Libglvnd_jll", "OpenSSL_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libxcb_jll", "Xorg_xcb_util_image_jll", "Xorg_xcb_util_keysyms_jll", "Xorg_xcb_util_renderutil_jll", "Xorg_xcb_util_wm_jll", "Zlib_jll", "xkbcommon_jll"]
git-tree-sha1 = "c6c0f690d0cc7caddb74cef7aa847b824a16b256"
uuid = "ea2cea3b-5b76-57ae-a6ef-0a8af62496e1"
version = "5.15.3+1"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.RecipesBase]]
git-tree-sha1 = "6bf3f380ff52ce0832ddd3a2a7b9538ed1bcca7d"
uuid = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
version = "1.2.1"

[[deps.RecipesPipeline]]
deps = ["Dates", "NaNMath", "PlotUtils", "RecipesBase"]
git-tree-sha1 = "e7eac76a958f8664f2718508435d058168c7953d"
uuid = "01d81517-befc-4cb6-b9ec-a95719d0359c"
version = "0.6.3"

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

[[deps.Revise]]
deps = ["CodeTracking", "Distributed", "FileWatching", "JuliaInterpreter", "LibGit2", "LoweredCodeUtils", "OrderedCollections", "Pkg", "REPL", "Requires", "UUIDs", "Unicode"]
git-tree-sha1 = "dad726963ecea2d8a81e26286f625aee09a91b7c"
uuid = "295af30f-e4ad-537b-8983-00126c2a3abe"
version = "3.4.0"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Scratch]]
deps = ["Dates"]
git-tree-sha1 = "f94f779c94e58bf9ea243e77a37e16d9de9126bd"
uuid = "6c6a2e73-6563-6170-7368-637461726353"
version = "1.1.1"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.Showoff]]
deps = ["Dates", "Grisu"]
git-tree-sha1 = "91eddf657aca81df9ae6ceb20b959ae5653ad1de"
uuid = "992d4aef-0814-514b-bc4d-f2e9a6c4116f"
version = "1.0.3"

[[deps.SimpleBufferStream]]
git-tree-sha1 = "874e8867b33a00e784c8a7e4b60afe9e037b74e1"
uuid = "777ac1f9-54b0-4bf8-805c-2214025038e7"
version = "1.1.0"

[[deps.SnoopPrecompile]]
git-tree-sha1 = "f604441450a3c0569830946e5b33b78c928e1a85"
uuid = "66db9d55-30c0-4569-8b51-7e840670fc0c"
version = "1.0.1"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "b3363d7460f7d098ca0912c69b082f75625d7508"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.0.1"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.SpecialFunctions]]
deps = ["ChainRulesCore", "IrrationalConstants", "LogExpFunctions", "OpenLibm_jll", "OpenSpecFun_jll"]
git-tree-sha1 = "d75bda01f8c31ebb72df80a46c88b25d1c79c56d"
uuid = "276daf66-3868-5448-9aa4-cd146d93841b"
version = "2.1.7"

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

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.0"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.TensorCore]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "1feb45f88d133a655e001435632f019a9a1bcdb6"
uuid = "62fd8b95-f654-4bbd-a8a5-9c27f68ccd50"
version = "0.1.1"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.TranscodingStreams]]
deps = ["Random", "Test"]
git-tree-sha1 = "8a75929dcd3c38611db2f8d08546decb514fcadf"
uuid = "3bb67fe8-82b1-5028-8e26-92a6c54297fa"
version = "0.9.9"

[[deps.Tricks]]
git-tree-sha1 = "6bac775f2d42a611cdfcd1fb217ee719630c4175"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.6"

[[deps.URIs]]
git-tree-sha1 = "e59ecc5a41b000fa94423a578d29290c7266fc10"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.4.0"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

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

[[deps.Wayland_jll]]
deps = ["Artifacts", "Expat_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "3e61f0b86f90dacb0bc0e73a0c5a83f6a8636e23"
uuid = "a2964d1f-97da-50d4-b82a-358c7fce9d89"
version = "1.19.0+0"

[[deps.Wayland_protocols_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4528479aa01ee1b3b4cd0e6faef0e04cf16466da"
uuid = "2381bf8a-dfd0-557d-9999-79630e7b1b91"
version = "1.25.0+0"

[[deps.XML2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "58443b63fb7e465a8a7210828c91c08b92132dff"
uuid = "02c8fc9c-b97f-50b9-bbe4-9be30ff0a78a"
version = "2.9.14+0"

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
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e45044cd873ded54b6a5bac0eb5c971392cf1927"
uuid = "3161d3a3-bdf6-5164-811a-617609db77b4"
version = "1.5.2+0"

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
# ╟─1f9f4012-1be5-42a4-8d56-949d783e6518
# ╟─5277a02b-2fd9-49b6-958f-3c6d53d3e433
# ╟─499d94be-99d3-4da2-b5cf-794f94e851e2
# ╟─9a4e9d24-3fd0-405f-adc3-4afc509629ef
# ╟─75ecba91-0134-4ebe-8c7d-683a75b86137
# ╟─f33dd982-062c-4369-ac89-4b4a6e2d231c
# ╟─1ea689c9-8cac-4045-b7e7-6ca0cf228b10
# ╠═4354f1c7-0bcd-41d5-b561-94d39882390d
# ╟─020231d4-c99c-43d4-b835-34450dadcf09
# ╠═bdc9dc1f-3a77-4588-8dba-f53ffd0da995
# ╟─33309480-de5b-48d8-8108-d4c349d3b540
# ╟─76cdc663-19dc-4a1e-8550-1d4a23ba7d18
# ╟─0d29d92b-41ba-4c90-b4fd-810402788e9f
# ╟─a7bbd43a-a1a3-40f2-a01a-48e6dbd2a302
# ╠═c6edc3fc-22ac-4d59-bd8a-edcb6ee1e6a5
# ╟─1055c56d-8ac7-4b3c-882d-d754dfa13a6e
# ╟─216516fa-f937-42ce-b4dd-d4890753ba77
# ╟─c5f95082-b8a6-45e7-a838-4ee9483b76d3
# ╟─84177121-0d8d-4d90-a3ac-48add3561563
# ╟─dd2e5088-71bb-4e3b-8045-7d5b9eaf3861
# ╠═46ae39af-c0ad-4c8f-80ae-c830946ca5ce
# ╟─655f4216-bad9-4a90-9fac-a8439bdbdeba
# ╠═ede13ff1-533e-4916-90b8-54a0288188d7
# ╟─628ddb1e-e6eb-43c4-b1a1-760431a5be88
# ╠═4013e8e0-34b4-4ad4-8e12-cd827d8cef71
# ╟─46cffa11-842e-4781-a291-f6fe4bd76ec6
# ╟─83386f45-c442-44dd-82f4-2c6909b0e1ef
# ╟─4135fa9e-37f7-461d-a064-c08c892bf0e4
# ╟─483480d6-427d-4f1f-9622-3cd267ac2aee
# ╟─f7a52930-8df8-4460-a942-c6bbf3ff5283
# ╟─a7ff7d1a-3cc0-4169-b955-c3e4284b478b
# ╟─88d250ff-0f4a-404c-b6dd-f977afd58033
# ╟─43c2b9bd-cbdc-43de-bf8c-f0cfec8f438f
# ╠═3d90d0d1-7364-45f4-a8b2-c129b01acc6f
# ╟─7b3693dc-5e73-48a2-b3c1-25a1acb65d9d
# ╟─1f4f7952-3a04-48a5-b016-811340d4d5b5
# ╟─ec518b39-8f04-433a-88dc-589d802a8764
# ╟─d2d7a521-3c6c-4835-8fd9-ada41a3fa84a
# ╟─a2dff0a0-4d68-49dd-86fd-8236795b3f44
# ╠═8974954c-afb3-4238-bcb3-4c7027af62e1
# ╟─99e21df1-559f-4e73-933e-5561205ed3f5
# ╟─feca6cc5-514f-423d-8a88-68ebf7a139b4
# ╠═1c525022-003b-45ab-9e89-ace963c2ae78
# ╟─6f5c99d9-e601-40db-b84a-0ad3d4f1cc26
# ╟─032831d9-8167-4039-a5ac-f088cc9efc21
# ╟─6d6d84cd-9fa1-4b9c-8146-730fe420fc74
# ╟─ed07e275-7ff6-4c9e-8a26-7dfcd79d7abe
# ╟─85234e93-01fe-47d8-be53-ef84f7cde6a9
# ╟─d62dc9fb-62f2-4503-8643-4aeeff617202
# ╠═c101ce8d-3da8-4836-a6aa-97cae52e7552
# ╟─e2eca547-4db1-4a6b-97ab-325e7be0a745
# ╟─e44e9399-4830-41a1-b3b4-95c5bb0ef24d
# ╟─2257a478-ed9b-4a7b-9dcc-5a29d7435990
# ╠═a99eb837-a18d-4a4c-a4d3-756cc2e6b1de
# ╟─6e11f240-f4a2-417b-aec5-e7c1cd5ee87f
# ╟─a0bba541-aab2-4c45-83be-743d0e9dc9ee
# ╟─4ab2ae32-7315-4867-9b9a-021a7bfb9e49
# ╠═9ad6bdff-e6b8-49b8-aef2-becc8e3898cc
# ╟─721e3e66-f198-43d3-acc4-a14164e1e29c
# ╟─b176721c-6a68-4041-b1a7-cbb7122d4af5
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
