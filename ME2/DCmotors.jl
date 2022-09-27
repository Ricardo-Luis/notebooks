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

# ╔═╡ 6b359fc5-ec8d-47ec-89ec-b1b214a37a82
begin
	using PlutoUI, PlutoTeachingTools # interface, ferramentas de edição
	using Plots  						# gráficos 
	using Dierckx  						# interpolação/extrapolação de dados
end

# ╔═╡ e227c53c-28a1-4d09-bf05-ba24236f613a
ThreeColumn(md"`DCmotors.Ex7.jl`", md"[![](https://img.shields.io/badge/GitHub_URL-notebook-C09107)](https://github.com/Ricardo-Luis/notebooks/blob/main/ME2/DCmotors.jl)", md"`Last update: 27·09·2022`")

# ╔═╡ c27a02b0-2646-4ef2-87a7-668a428ebd98
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

# ╔═╡ d45dcd85-db5f-4f9e-8f67-a82df904e0dc
md"""
---
$\textbf{MÁQUINAS ELÉTRICAS DE CORRENTE CONTÍNUA}$

$\text{EXERCÍCIO 7}$ 

$\textbf{Motores DC}$
---
"""

# ╔═╡ ed44a647-2ed8-47f3-84d0-3efde79cf276
md"""
# Exercício 7. Dados:
"""

# ╔═╡ ed4846d5-70d2-4deb-9a4a-41cdc8c99bdd
md"""
**Considere um motor de corrente contínua, com a seguinte chapa de características:**
"""

# ╔═╡ 1301d1ad-89e8-4282-ab35-1a6b8214bea0
(Pᵤ, Uₙ, nₙ, ηₙ, Rᵢ, Rₛ, Ns, Rd, Nd) = (17e3, 250, 1200, 0.85, 0.6, 0.1, 12, 200, 3000)

# ╔═╡ 1a427cf6-b2d3-4d9b-9cb5-4682d5f49869
begin
	nmag=1200 # velocidade angular da característica magnética, rpm
	Iex=[0,0.0132,0.03,0.033,0.067,0.1,0.133,0.167,0.2,0.233,0.267,0.3,0.333,0.367,0.4,0.433,0.467,0.5,0.533,0.567,0.6,0.633,0.667,0.7,0.733,0.767,0.8,0.833,0.867,0.9,0.933,0.966,1,1.033,1.067,1.1,1.133,1.167,1.2,1.233,1.267,1.3,1.333,1.367,1.4,1.433,1.466,1.5]
	E₀=[5.40, 6.67,13.33,16,31.3,45.46,60.26,75.06,89.74,104.4,118.86,132.86,146.46,159.78,172.18,183.98,195.04,205.18,214.52,223.06,231.2,238,244.14,249.74,255.08,259.2,263.74,267.6,270.8,273.6,276.14,278,279.74,281.48,282.94,284.28,285.48,286.54,287.3,287.86,288.36,288.82,289.2,289.38,289.57,289.69,289.81,289.95]
	plot(Iex, E₀, title="E₀=f(Iₑₓ), n=1200rpm", xlabel = "Iₑₓ (A)", ylabel="E₀ (V)", ylims=(0,300), framestyle = :origin, minorticks=10, label=:none, linewidth=2)
end

# ╔═╡ e2fc78d6-480b-4fe0-b844-0d4329c0d572
md"""
# Influência de $$ΔE$$ 💻
"""

# ╔═╡ 8bde3ad9-2d03-4557-ab50-a89ac8e834a3
md"""
!!! nota
	No enunciado original não é considerada a existência de reacção magnética do induzido, $$(ΔE=0\rm V)$$.  
	No entanto, na versão *notebook* para que se possa verificar a influência de $$ΔE$$, nas características de funcionamento do motor DC, para os diferentes tipos de excitação, uma curva de $$ΔE=f(I_i)$$ é considerada como uma opção de análise."""

# ╔═╡ 61238dc4-3c9d-4b59-9486-501988806c27
"Com ΔE?", @bind z CheckBox()

# ╔═╡ c4d5e3f9-7808-48f6-8d33-05607d8e5a4e
begin
	Iᵢ=[0.0:15:120;]
	#Iᵢ=[0.0, 15, 30, 45, 60, 75, 90, 105, 120]
	ΔE=[0.0, 1.5, 4, 7.5, 12, 17, 23, 30.5, 40]*z
	plot(Iᵢ, ΔE, title="ΔE=f(Iᵢ)", xlabel = "Iᵢ (A)", ylabel="ΔE (V)", xlims=(0,120), ylims=(0,40), framestyle = :origin, minorticks=5, label=:none, linewidth=2)
end

# ╔═╡ 54da2314-4fa8-483b-9627-9e454c110f3d


# ╔═╡ f6fcec56-b080-4016-baf0-0ab728f255f3
md"""
# a) $$R_c$$ para condições nominais
**Com o motor em excitação derivação, determine o valor do reóstato de campo, nas
condições nominais $$(U_n, I_n, n_n)$$**;
"""

# ╔═╡ d9e431c5-be62-40c8-b5d6-59d5808e4436
md"""
Para se ter a informação completa das condições nominais do motor, falta determinar o valor da corrente nominal, $$I_n$$.\
Da chapa de características do motor conhecem-se a potência útil (potência mecânica) e rendimento nominais, $$P_u$$ e $$\eta_n$$, respectivamente, o que permite obter a potência absorvida, $$P_{ab}=U_nI_n$$. Assim: 
"""

# ╔═╡ cde4847b-6c38-4bc6-a869-514774630c89
md"""
$$I_n=\frac{P_n}{\eta U_n}$$
"""

# ╔═╡ 1c70002d-e3fb-4d81-b0f9-ed00d69173ff
Iₙ = Pᵤ / (ηₙ * Uₙ);

# ╔═╡ 5b4c1912-126d-4fe8-87c5-f65b299f3642
md"""
Calculando obtém-se $$I_n=$$ $(Iₙ)A
"""

# ╔═╡ d8d6a6e9-df8d-47d2-832a-0d2126ce760e
md"""
A velocidade, $$n$$, é dependente do fluxo magnético, $$kϕ_0$$, que por sua vez depende da corrente de excitação, $$I_d$$ e da característica magnética da máquina.\
Assim, a imagem do fluxo magnético presente na máquina é dada pela a força contra-electromotriz de vazio do motor, $$E_0^{'}$$:
"""

# ╔═╡ 0ff562ff-7af2-4749-87f5-8766cb695893
md"""
$$E_0^{'}=E^{'}+ΔE$$
Sendo a  a força contra-electromotriz efectiva, $$E^{'}$$, dada por:\
"""

# ╔═╡ cf0f089a-1901-4ad1-8fe9-b9028679b109
md"""
$$E^{'}=U-R_iI_i$$
"""

# ╔═╡ de954f1d-a3ac-4830-acd0-85e64afdf0cd
# forma computacional de consultar a curva de ΔE(Ii), por interpolação dos dados através do Pkg Dierckx.jl
begin
	ΔE_int = Spline1D(Iᵢ, ΔE)  
	ΔEₙ = ΔE_int(Iₙ)
	ΔEₙ = round(ΔEₙ, digits=1)
end;

# ╔═╡ 68969be8-0bee-4cca-85de-7a8d2aa35ee2
md"""
O valor de $$ΔE$$ para $$I_n$$, consultando a sua curva de q.d.t é: $$ΔE=$$ $(ΔEₙ)V.  
"""


# ╔═╡ 8f5b0bd5-7a65-4ba3-bdd1-7cc3128fa8d8
E = Uₙ - Rᵢ * Iₙ;

# ╔═╡ 7d6a01a4-4876-42dc-ab66-f7f736d41a32
E₀ₙ = E + ΔEₙ;

# ╔═╡ 0a35c6dc-0967-4f8a-9fff-904f9062eeab
md"""
Calculando as f.c.e.m., obtêm-se $$E^{'}=$$ $(E)V e $$E_0^{'}=$$ $(E₀ₙ)V.
"""

# ╔═╡ 9d82a20f-3a14-4796-88e9-e27720632bbd
md"""

Note que tomou-se a corrente do rotor aproximadamente igual à corrente absorvida, $$I_i\simeq I_n$$, sendo no entanto, $$I_i=I_n+I_d$$. Contudo, não se está a desprezar a corrente $$I_d$$, mas sim a q.d.t. em $$R_i$$ devido a $$I_d$$. Ou seja, $$R_iI_d\lll R_iI$$ para efeito de cálculo de $$E_0^{'}$$ e uma vez que $$I_d$$ ainda não está calculada.
"""

# ╔═╡ 04b517f9-ed9f-4a5d-929b-82b10de843b9
md"""
A característica magnética foi obtida à mesma velocidade inscrita na chapa de características da máquina, $$n_n$$, por conseguinte, obtém-se dela directamente a corrente de campo, $$I_d$$.
"""

# ╔═╡ cfc7844e-3974-46ef-a53a-ee6a1a85d7f3
# forma computacional de consultar a característica magnética, por interpolação dos dados através do Pkg Dierckx.jl
begin
	Id_int = Spline1D(E₀, Iex)  
	Id = Id_int(E₀ₙ)
	Id = round(Id, digits=2)
end;

# ╔═╡ 71356175-ffe4-4c3a-a895-8a4be8713a44
md"""
Consultando a característica magnética a 1200rpm, verifica-se para $$E₀=$$ $(E₀ₙ)V $$\Rightarrow$$ $$I_d=$$ $(Id)A.
"""

# ╔═╡ d85a5505-1ab5-43d0-97ad-a0cb4a220c06
md"""
Assim, o reostato de campo para colocar o motor *shunt* nas condições nominais é dado por:
"""

# ╔═╡ 7c572ab7-2292-423c-b611-68573b289265
md"""
$$R_c=\frac{U_n}{I_d}-R_d$$
"""

# ╔═╡ 14ad0875-e27a-442e-81e9-29d1abaeac17
begin
	Rc = Uₙ / Id - Rd
	Rc = round(Rc, digits=1)
end;

# ╔═╡ 50022e39-c2f4-455f-8d26-7c9246190b11
md"""
Calculando, obtém-se $$R_c=$$ $(Rc)Ω
"""

# ╔═╡ 4bac08e5-7a7a-496f-8d67-aa2bc4b10236
md"""
> Poderá então observar as diferenças de cálculo relativas à presença de q.d.t. devido à reacção magnética do induzido, ou seja, uma máquina com pólos auxiliares (caso mais frequente), conduz a $$ΔE \neq 0$$V, variável em função da corrente do induzido. No caso de uma máquina com pólos auxiliares e enrolamentos de compensação, a reacção magnética do induzido estará compensada e assim tem-se:
"""

# ╔═╡ 5abe64cf-9291-48d6-bf60-7335551ee791
md"""
$$ΔE=0 \Rightarrow E_0^{'}=E^{'}$$
"""

# ╔═╡ ac32afe0-e30f-402e-995e-8b0cacf8af10


# ╔═╡ 4989ff81-ac16-446c-8d8a-e3cb9e5950b6
md"""
# b) Motor shunt
**Utilizando o reóstato de campo calculado na alínea anterior, determine as características de velocidade, binário e mecânica deste motor (excitação derivação);**
"""

# ╔═╡ 1d458a5a-545f-4ab6-900b-9d84ebbaf51d
md"""
> Na resolução computacional para o **motor de excitação derivação**, as grandezas calculadas estão identificadas como: k$$ϕ$$₀₁, n₁, E₁, ω₁, Td₁
"""

# ╔═╡ d25759bf-6e81-439c-a2c9-c19704379437
begin
	kϕ₀₁ = E₀ₙ / nmag
	kϕ₀₁ = round(kϕ₀₁, digits=3)
end;

# ╔═╡ 4652d9e4-e2c6-47c4-93d1-1e360ffb7e57
md"""
Tomando o valor calculado de $$R_c=$$ $(Rc)Ω, resulta $$I_d=$$ $(Id)A, o que permite calcular o fluxo magnético da máquina em vazio, $$kϕ₀$$, que no motor de excitação derivação permanece constante.  
Assim, $$kϕ₀=$$ $(kϕ₀₁)V/rpm
"""

# ╔═╡ 4629c049-8882-4823-bdea-93e3d70cc901
md"""
A determinação da característica de velocidade $$n=f(I)$$ ou $$n=f(I_i)$$, uma vez que $$I_i\simeq I$$, consiste em sucessivamente realizar o cálculo da velocidade do motor para diferentes valores de corrente:  
"""

# ╔═╡ ea81ca51-dccc-4187-b788-7ed64716e698
md"""
$$n=\frac{U-R_iI_i+\Delta E}{k\phi_0}$$ com $$n$$ em rpm, $$\Delta E=f(I_i)$$ e $$k\phi_0=$$constante, em V/rpm.
"""

# ╔═╡ 6030b931-51a0-42fc-9b74-5635b590e6f5
# Característica de velocidade:
begin
	I = 0:1:1.5*Iₙ
	Ii = I .- Id
	ΔEᵢ = ΔE_int(Ii)
	n₁ = (Uₙ .- Rᵢ*Ii .+ ΔEᵢ) / kϕ₀₁
end;

# ╔═╡ d47a90f0-f8bc-44d0-b71c-c0bc59d0d23c
md"""
Similarmente, a característica de binário, $$T=f(I)$$ ou $$T=f(I_i)$$, podendo $$T$$ ser o binário desenvolvido, $$T_d$$, ou o binário útil, $$T_u$$, atendendo que: $$T_d=T_u+T_p$$, consiste em sucessivamente realizar o cálculo do binário para diferentes valores de corrente:  
"""

# ╔═╡ 3c921729-6534-4eac-abb0-4eb362295b91
md"""
$$T_d=\frac{E^{'}}{ω}I_i\:\:\:;\:\:\:ω=\frac{2πn}{60}$$ com $$ω$$ em rad/s.
"""

# ╔═╡ 4da7f391-e3bf-4e12-aa6b-a7ef5e45d3b9
# Característica de binário:
begin
	E₁ = Uₙ .- Rᵢ * Ii
	ω₁ = 2π .* n₁ / 60
	Td₁ = (E₁ ./ ω₁) .* Ii
end;

# ╔═╡ df3609ef-80f2-464a-b522-f289ea9344b4


# ╔═╡ f499659c-b042-4002-bb27-980daf8502d4
md"""
# c) Motor compound
**Idem, com excitação composta em longa derivação aditiva e subtrativa. Representar as características nos mesmos gráficos para comparação;**
"""

# ╔═╡ 72a079e6-0c41-4c50-9ee2-838d5cc60c85
md"""
No motor de excitação composta, o fluxo magnético depende da contribuição das forças magnetomotrizes de ambos os enrolamentos de excitação e da forma como estes estão ligados entre si (de forma aditiva ou subtractiva):
"""

# ╔═╡ 58e9df34-7471-4942-ac06-2505f52875f2
md"""
$$I_{ex}N_d=I_dN_d\pm I_sN_s$$
sendo $$I_s$$ a corrente que percorre o enrolamento de excitação série.
"""

# ╔═╡ f305c434-9d0c-497d-8335-bf25aa80e915
md"""
Assim, $$I_{ex}$$ é a corrente de campo que representa o fluxo total da máquina, sendo obtida por:
"""

# ╔═╡ 0ce81a6e-965c-4dc0-b9f3-f8c09143460e
md"""
$$I_{ex}=I_d \pm \frac{N_s}{N_d}I_s$$
"""

# ╔═╡ 1cd42258-7583-4288-9c6d-4d47facb69e1
md"""
Assim, a característica de velocidade para o motor de excitação composta em longa derivação é obtida por cálculo sucessivo da velocidade do motor para diferentes valores de corrente, através de:  
"""

# ╔═╡ facb1900-1093-46c7-97b2-187b67e21294
md"""
$$n=\frac{U-(R_i+R_s)I_i+\Delta E}{k\phi_t}$$ com $$k\phi_t=k(\phi_d \pm 	\phi_s)$$, em V/rpm obtido através da característica magnética da máquina.
"""

# ╔═╡ 6aae7842-4889-4be6-bd1d-eab44c610af8


# ╔═╡ 7ad852d3-e3b8-4799-8aae-a52c1ebe34ac
md"""
> Na resolução computacional para o **motor de excitação composta aditiva**, as grandezas calculadas estão identificadas como: `Iex₂`, `E₀₂`, `kϕ₀₂`, `n₂`, `E₂`, `ω₂`, `Td₂`
"""

# ╔═╡ b4e5cbd1-c1c1-47e1-a8aa-8fc2ef628e87
begin
	Iex₂ = Id .+ (Ns / Nd) * Ii
	E₀_int1 = Spline1D(Iex, E₀)  # função de interpolação para a caract. magnética
	E₀₂ = E₀_int1(Iex₂) # fem que contém os fluxos derivação + série
	kϕ₀₂ = E₀₂ / nmag
	n₂ = (Uₙ .- (Rᵢ + Rₛ) * Ii .+ ΔEᵢ) ./ kϕ₀₂
	E₂ = Uₙ .- (Rᵢ + Rₛ) * Ii
	ω₂ = 2π .* n₂ / 60
	Td₂ = (E₂ ./ ω₂) .* Ii
end;

# ╔═╡ 55397202-48ae-4a3d-a053-9f46e6638560


# ╔═╡ 1a154f27-cd9a-4de8-b850-599b5e810811
md"""
> Na resolução computacional para o **motor de excitação composta subractiva**, as grandezas calculadas estão identificadas como: `Iex₃`, `E₀₃`, `kϕ₀₃`, `n₃`, `ω₃`, `Td₃`
"""

# ╔═╡ 626c5cab-64e2-446c-9d38-f01dde099d3e
begin
	Iex₃ = Id .- (Ns / Nd) * Ii
	E₀₃ = E₀_int1(Iex₃) #fem que contém os fluxos derivação - série
	kϕ₀₃ = E₀₃ / nmag
	n₃ = (Uₙ .- (Rᵢ + Rₛ) * Ii .+ ΔEᵢ) ./ kϕ₀₃
	ω₃ = 2π .* n₃ / 60
	Td₃ = (E₂ ./ ω₃) .* Ii
end;

# ╔═╡ 1c659ae6-1b29-43a5-92f7-30b1f24c3696


# ╔═╡ 426c40b4-5fa1-4d8a-b03c-11f3008484f6
md"""
# d) Motor série
**Determinar as curvas características com o circuito de derivação desligado (motor série). Representar as características nos mesmos gráficos para comparação;**
"""

# ╔═╡ 8dfd7146-2e55-4ea0-8cf2-3557d89e96e1
md"""
> Na resolução computacional para o **motor de excitação série**, as grandezas calculadas estão identificadas como: Iex₄, E₀₄, k$$ϕ$$₀₄, n₄, ω₄, Td₄
"""

# ╔═╡ 4e4469c8-994d-42c6-b373-8f295768b8b0
begin
	Iex₄ = (Ns / Nd) * Ii
	E₀₄ = E₀_int1(Iex₄) #fem que contém apenas fluxo série
	kϕ₀₄ = E₀₄ / nmag
	n₄ = (Uₙ .- (Rᵢ + Rₛ) *Ii .+ ΔEᵢ) ./ kϕ₀₄
	ω₄ = 2π .* n₄ / 60
	Td₄ = (E₂ ./ ω₄) .* Ii
end;

# ╔═╡ a45ad7c2-2f83-4e04-bdaf-8dcc30a150f5
# Características de velocidade, plots:
begin
	plot(I, n₁, linewidth=2, title="Características de velocidade", xlabel = "I (A)", ylabel="n (rpm)",  framestyle = :origin, minorticks=5, label="shunt")
	plot!(I,n₂, linewidth=2, label="comp. aditivo")
	plot!(I,n₃, linewidth=2, label="comp. subtractivo", legend=:bottomleft)
	plot!(I,n₄, linewidth=2, label="série", xlims=(0,120), ylims=(0,3000))
end

# ╔═╡ 5b866db3-ddd6-4bfd-b027-761c07d6755c
# Características de binário, plots:
begin
	plot(I, Td₁, linewidth=2, title="Características de binário", xlabel = "I (A)", ylabel="Td (Nm)",  framestyle = :origin, minorticks=5, label="shunt")
	plot!(I,Td₂, linewidth=2, label="comp. aditivo")
	plot!(I,Td₃, linewidth=2, label="comp. subtractivo", legend=:topleft)
	plot!(I,Td₄, linewidth=2, label="série", xlims=(0,120), ylims=(0,250))
end

# ╔═╡ 326135bd-24e3-492d-a7d5-1a14f065e80f
# Características mecânicas, plots:
begin
	plot(Td₁, n₁, linewidth=2, title="Características mecânicas", ylabel = "n (rpm)", xlabel="Td (Nm)",  framestyle = :origin, minorticks=5, label="shunt")
	plot!(Td₂, n₂, linewidth=2, label="comp. aditivo")
	plot!(Td₃, n₃, linewidth=2, label="comp. subtractivo", legend=:topright)
	plot!(Td₄, n₄, linewidth=2, label="série", xlims=(0,250), ylims=(0,3000))
end

# ╔═╡ 66e32f84-8b2a-4a3d-81fe-16437ecc3c18


# ╔═╡ 60db00b7-c78b-4c26-9530-c62fcfd1bfd2
md"""
# e) MI: variação $$n=f(I)$$ 💻
**Considere o motor com excitação independente (MI), Uexc = 240V , com o reóstato de campo calculado na alínea a). Explicite a variação da característica de velocidade nas situações:**
1. **aumento de tensão do induzido;**
2. **diminuição do reóstato de campo;**
3. **aumento da resistência adicional.**
"""

# ╔═╡ 4fdea2ae-3bf8-42cd-bf6f-411eaf8223c3
md"""
> Na resolução computacional para o **motor de excitação separada**, as grandezas calculadas estão identificadas como: `Ui`, `Iex5`, `E₀₅`, `kϕ₀₅`, `ΔEᵢᵢ`, `n₅`, `ω₅`, `Td₅`
"""

# ╔═╡ 36295cf6-19ba-4240-9806-745ec0bfdccd
begin
	H1=("Tensão do induzido, Ui", @bind Ui PlutoUI.Slider(150:1:350, default=250.0, show_value=true))
	H2=("Reostato de campo, Rc1", @bind Rc1 PlutoUI.Slider(0*Rc:0.01*Rc:2.5*Rc, default= Rc, show_value=true))
	H3=("Resistência adicional, Rad", @bind Rad PlutoUI.Slider(0:0.1:1.5, default=0.0, show_value=true))
	H1, H2, H3
end

# ╔═╡ e648310c-8172-4cf0-ab72-f40229ba2577
begin
	Uexc = 240
	Iex₅ = Uexc /(Rc1 + Rd)
	E₀₅ = E₀_int1(Iex₅) 				#fem para excitação separada
	kϕ₀₅ = E₀₅ / nmag
	ΔEᵢᵢ = ΔE_int(I)
	n₅ = (Ui .- (Rᵢ + Rad) *I .+ ΔEᵢᵢ) ./ kϕ₀₅
	E₅ = Ui .- (Rᵢ + Rad) * I
	ω₅ = 2π .* n₅ / 60
	Td₅ = (E₅ ./ ω₅) .* Ii
end;

# ╔═╡ 4919a95d-cd66-401c-af76-6155087462a3
# Característica de velocidade vs. variação de Ui, Rc1 ou Rad; plots:
begin
	plot(I, n₅, ylims=(0,3000),linewidth=2, framestyle = :origin, title="Variação da característica de velocidade", label=:none, xlabel = "I (A)", ylabel="n (rpm)", minorticks=5, xlims=(0,120))
end

# ╔═╡ 8ad59666-3801-44a3-b26a-197a8f60db02
md"""
!!! nota
	# f) MI: variação $$T=f(I)$$ 💻
	**Apresenta-se uma alínea f) idêntica à alínea anterior, mas considerando a característica de binário:**  
"""

# ╔═╡ babc5b0b-3263-47d5-bd33-56917ece1e6b
md"""
**Considere o motor com excitação independente (MI), Uexc = 240V , com o reóstato de campo calculado na alínea a). Explicite a variação da característica de binário nas situações:**
1. **aumento de tensão do induzido;**
2. **diminuição do reóstato de campo;**
3. **aumento da resistência adicional.**
"""

# ╔═╡ 49cc56bc-bd1e-4e07-9d9c-0ccfaa92e7b0
# Característica de binário vs. variação de Ui, Rc1 ou Rad; plots:
begin
	plot(I, Td₅, ylims=(0,250),linewidth=2, framestyle = :origin, title="Variação da característica de binário", label=:none, xlabel = "I (A)", ylabel="Td (Nm)", minorticks=5, xlims=(0,120))
end

# ╔═╡ 0bda0726-fcf9-491d-ad24-301521cb5892


# ╔═╡ 0835d195-7b73-4da2-bd99-a0adb9e893e8
md"""
# *Notebook*
"""

# ╔═╡ 5ae2c37a-c117-4ad8-831f-16edb4b9bfbd
md"""
Documentação das bibliotecas Julia utilizadas:  [Dierckx](https://github.com/kbarbary/Dierckx.jl), [Plots](http://docs.juliaplots.org/latest/), [PlutoUI](https://juliahub.com/docs/PlutoUI/abXFp/0.7.6/).
"""

# ╔═╡ f14c87a4-fe11-48ec-b1a1-ccb10da59734
begin
	# other stuff:
	isel_logo="https://www.isel.pt/sites/default/files/NoPath%20-%20Copy%402x_0.png"
	julia_logo="https://github.com/JuliaLang/julia-logo-graphics/blob/master/images/julia-logo-color.png?raw=true"
	version=VERSION
end;

# ╔═╡ 407d58b8-a759-436f-888e-0292cfd0d17d
ThreeColumn(md"$(Resource(isel_logo, :height => 75))", md"
$\textbf{\color{green}{Lic. em Engenharia Eletrotécnica }}$", md"$\text{ Máquinas Elétricas II}$")

# ╔═╡ 8c55b337-aaf5-4ffc-ae2e-44d5158510ee
md"""
*Notebook* realizado em linguagem de computação científica Julia versão $(version).

**_Time to first plot_**: até cerca de 1.6 min.

**Computador**: Intel® Core™ i5-6300U CPU @ 2.40GHz; 20GB RAM.
"""

# ╔═╡ 799d4429-92d9-4eb1-8fd2-566eac6919fb
md"""
!!! info
	No índice deste *notebook*, os tópicos assinalados com "💻" requerem a participação do estudante.
"""

# ╔═╡ 476100eb-b723-4fda-944d-a190e56707b1
TableOfContents(title="Índice")

# ╔═╡ 40e406a9-f8eb-4924-a81c-09f6aa08fda2
md"""
---
"""

# ╔═╡ c6f04e71-b018-4507-8ee1-500117cfa1cd
ThreeColumn(md"Text content: [![](https://i.creativecommons.org/l/by-sa/4.0/80x15.png)](http://creativecommons.org/licenses/by-sa/4.0/)", md" $(Resource(julia_logo, :height => 15)) `code`: [`MIT License`](https://www.tldrlegal.com/l/mit)", md"[$$© \text{ 2022 Ricardo Luís}$$](https://ricardo-luis.github.io/me2/)")

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Dierckx = "39dd38d3-220a-591b-8e3c-4c3a8c710a94"
Plots = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
PlutoTeachingTools = "661c6b06-c737-4d37-b85c-46df65de6f69"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
Dierckx = "~0.5.1"
Plots = "~1.22.6"
PlutoTeachingTools = "~0.2.3"
PlutoUI = "~0.7.43"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[Adapt]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "84918055d15b3114ede17ac6a7182f68870c16f7"
uuid = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
version = "3.3.1"

[[ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[Bzip2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "19a35467a82e236ff51bc17a3a44b69ef35185a2"
uuid = "6e34b625-4abd-537c-b88f-471c36dfa7a0"
version = "1.0.8+0"

[[Cairo_jll]]
deps = ["Artifacts", "Bzip2_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "JLLWrappers", "LZO_jll", "Libdl", "Pixman_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "4b859a208b2397a7a623a03449e4636bdb17bcf2"
uuid = "83423d85-b0ee-5818-9007-b63ccbeb887a"
version = "1.16.1+1"

[[ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "d9e40e3e370ee56c5b57e0db651d8f92bce98fea"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.10.1"

[[CodeTracking]]
deps = ["InteractiveUtils", "UUIDs"]
git-tree-sha1 = "1833bda4a027f4b2a1c984baddcf755d77266818"
uuid = "da1fd8a2-8d9e-5ec2-8556-3022fb5608a2"
version = "1.1.0"

[[ColorSchemes]]
deps = ["ColorTypes", "Colors", "FixedPointNumbers", "Random"]
git-tree-sha1 = "a851fec56cb73cfdf43762999ec72eff5b86882a"
uuid = "35d6a980-a343-548e-a6ea-1d62b119f2f4"
version = "3.15.0"

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

[[Compat]]
deps = ["Base64", "Dates", "DelimitedFiles", "Distributed", "InteractiveUtils", "LibGit2", "Libdl", "LinearAlgebra", "Markdown", "Mmap", "Pkg", "Printf", "REPL", "Random", "SHA", "Serialization", "SharedArrays", "Sockets", "SparseArrays", "Statistics", "Test", "UUIDs", "Unicode"]
git-tree-sha1 = "31d0151f5716b655421d9d75b7fa74cc4e744df2"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "3.39.0"

[[CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "0.5.2+0"

[[Contour]]
deps = ["StaticArrays"]
git-tree-sha1 = "9f02045d934dc030edad45944ea80dbd1f0ebea7"
uuid = "d38c429a-6771-53c6-b99e-75d170b6e991"
version = "0.5.7"

[[DataAPI]]
git-tree-sha1 = "cc70b17275652eb47bc9e5f81635981f13cea5c8"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.9.0"

[[DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "7d9d316f04214f7efdbb6398d545446e246eff02"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.10"

[[DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[Dierckx]]
deps = ["Dierckx_jll"]
git-tree-sha1 = "5fefbe52e9a6e55b8f87cb89352d469bd3a3a090"
uuid = "39dd38d3-220a-591b-8e3c-4c3a8c710a94"
version = "0.5.1"

[[Dierckx_jll]]
deps = ["CompilerSupportLibraries_jll", "Libdl", "Pkg"]
git-tree-sha1 = "a580560f526f6fc6973e8bad2b036514a4e3b013"
uuid = "cd4c43a9-7502-52ba-aa6d-59fb2a88580b"
version = "0.0.1+0"

[[Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "a32185f5428d3986f47c2ab78b1f216d5e6cc96f"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.8.5"

[[Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[EarCut_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "3f3a2501fa7236e9b911e0f7a588c657e822bb6d"
uuid = "5ae413db-bbd1-5e63-b57d-d24a61df00f5"
version = "2.2.3+0"

[[Expat_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b3bfd02e98aedfa5cf885665493c5598c350cd2f"
uuid = "2e619515-83b5-522b-bb60-26c02a35a201"
version = "2.2.10+0"

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

[[FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

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

[[GLFW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libglvnd_jll", "Pkg", "Xorg_libXcursor_jll", "Xorg_libXi_jll", "Xorg_libXinerama_jll", "Xorg_libXrandr_jll"]
git-tree-sha1 = "0c603255764a1fa0b61752d2bec14cfbd18f7fe8"
uuid = "0656b61e-2033-5cc2-a64a-77c0f6c09b89"
version = "3.3.5+1"

[[GR]]
deps = ["Base64", "DelimitedFiles", "GR_jll", "HTTP", "JSON", "Libdl", "LinearAlgebra", "Pkg", "Printf", "Random", "Serialization", "Sockets", "Test", "UUIDs"]
git-tree-sha1 = "d189c6d2004f63fd3c91748c458b09f26de0efaa"
uuid = "28b8d3ca-fb5f-59d9-8090-bfdbd6d07a71"
version = "0.61.0"

[[GR_jll]]
deps = ["Artifacts", "Bzip2_jll", "Cairo_jll", "FFMPEG_jll", "Fontconfig_jll", "GLFW_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll", "Pixman_jll", "Pkg", "Qt5Base_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "cafe0823979a5c9bff86224b3b8de29ea5a44b2e"
uuid = "d2c73de3-f751-5644-a686-071e5b155ba9"
version = "0.61.0+0"

[[GeometryBasics]]
deps = ["EarCut_jll", "IterTools", "LinearAlgebra", "StaticArrays", "StructArrays", "Tables"]
git-tree-sha1 = "58bcdf5ebc057b085e58d95c138725628dd7453c"
uuid = "5c1252a2-5f33-56bf-86c9-59e7332b4326"
version = "0.4.1"

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

[[Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "c47c5fa4c5308f27ccaac35504858d8914e102f9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.4"

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

[[InverseFunctions]]
deps = ["Test"]
git-tree-sha1 = "f0c6489b12d28fb4c2103073ec7452f3423bd308"
uuid = "3587e190-3f89-42d0-90ee-14403ec27112"
version = "0.1.1"

[[IrrationalConstants]]
git-tree-sha1 = "7fd44fd4ff43fc60815f8e764c0f352b83c49151"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.1.1"

[[IterTools]]
git-tree-sha1 = "05110a2ab1fc5f932622ffea2a003221f4782c18"
uuid = "c8e1da08-722c-5040-9ed9-7db0dc04731e"
version = "1.3.0"

[[IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[JLLWrappers]]
deps = ["Preferences"]
git-tree-sha1 = "642a199af8b68253517b80bd3bfd17eb4e84df6e"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.3.0"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[JpegTurbo_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "d735490ac75c5cb9f1b00d8b5509c11984dc6943"
uuid = "aacddb02-875f-59d6-b918-886e6ef4fbf8"
version = "2.1.0+0"

[[JuliaInterpreter]]
deps = ["CodeTracking", "InteractiveUtils", "Random", "UUIDs"]
git-tree-sha1 = "0f960b1404abb0b244c1ece579a0ec78d056a5d1"
uuid = "aa1ae85d-cabe-5617-a682-6adf51b2e16a"
version = "0.9.15"

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
git-tree-sha1 = "c7f1c695e06c01b95a67f0cd1d34994f3e7db104"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.2.1"

[[Latexify]]
deps = ["Formatting", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "Printf", "Requires"]
git-tree-sha1 = "669315d963863322302137c4591ffce3cb5b8e68"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.15.8"

[[LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.3"

[[LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "7.84.0+0"

[[LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.10.2+0"

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

[[LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[LogExpFunctions]]
deps = ["ChainRulesCore", "DocStringExtensions", "InverseFunctions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "6193c3815f13ba1b78a51ce391db8be016ae9214"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.4"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[LoweredCodeUtils]]
deps = ["JuliaInterpreter"]
git-tree-sha1 = "dedbebe234e06e1ddad435f5c6f4b85cd8ce55f7"
uuid = "6f1432cf-f94c-5a45-995e-cdbf5db27b0b"
version = "2.2.2"

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
version = "2.28.0+0"

[[Measures]]
git-tree-sha1 = "e498ddeee6f9fdb4551ce855a46f54dbd900245f"
uuid = "442fdcdd-2543-5da2-b0f3-8c86c306513e"
version = "0.3.1"

[[Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "bf210ce90b6c9eed32d25dbcae1ebc565df2687f"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.0.2"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.2.1"

[[NaNMath]]
git-tree-sha1 = "bfe47e760d60b82b66b61d2d44128b62e3a369fb"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "0.3.5"

[[NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[Ogg_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "887579a3eb005446d514ab7aeac5d1d027658b8f"
uuid = "e7412a2a-1a6e-54c0-be00-318e2571c051"
version = "1.3.5+1"

[[OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.20+0"

[[OpenSSL_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "15003dcb7d8db3c6c857fda14891a539a8f2705a"
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "1.1.10+0"

[[Opus_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "51a08fb14ec28da2ec7a927c4337e4332c2a4720"
uuid = "91d4177d-7536-5919-b921-800302f37372"
version = "1.3.2+0"

[[OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[PCRE_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b2a7af664e098055a7529ad1a900ded962bca488"
uuid = "2f80f16e-611a-54ab-bc61-aa92de5b98fc"
version = "8.44.0+0"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "98f59ff3639b3d9485a03a72f3ab35bab9465720"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.0.6"

[[Pixman_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b4f5d02549a10e20780a24fce72bea96b6329e29"
uuid = "30392449-352a-5448-841d-b1acce4e97dc"
version = "0.40.1+0"

[[Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.8.0"

[[PlotThemes]]
deps = ["PlotUtils", "Requires", "Statistics"]
git-tree-sha1 = "a3a964ce9dc7898193536002a6dd892b1b5a6f1d"
uuid = "ccf2f8ad-2431-5c83-bf29-c5338b663b6a"
version = "2.0.1"

[[PlotUtils]]
deps = ["ColorSchemes", "Colors", "Dates", "Printf", "Random", "Reexport", "Statistics"]
git-tree-sha1 = "b084324b4af5a438cd63619fd006614b3b20b87b"
uuid = "995b91a9-d308-5afd-9ec6-746e21dbc043"
version = "1.0.15"

[[Plots]]
deps = ["Base64", "Contour", "Dates", "Downloads", "FFMPEG", "FixedPointNumbers", "GR", "GeometryBasics", "JSON", "Latexify", "LinearAlgebra", "Measures", "NaNMath", "PlotThemes", "PlotUtils", "Printf", "REPL", "Random", "RecipesBase", "RecipesPipeline", "Reexport", "Requires", "Scratch", "Showoff", "SparseArrays", "Statistics", "StatsBase", "UUIDs"]
git-tree-sha1 = "ba43b248a1f04a9667ca4a9f782321d9211aa68e"
uuid = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
version = "1.22.6"

[[PlutoHooks]]
deps = ["InteractiveUtils", "Markdown", "UUIDs"]
git-tree-sha1 = "072cdf20c9b0507fdd977d7d246d90030609674b"
uuid = "0ff47ea0-7a50-410d-8455-4348d5de0774"
version = "0.0.5"

[[PlutoLinks]]
deps = ["FileWatching", "InteractiveUtils", "Markdown", "PlutoHooks", "Revise", "UUIDs"]
git-tree-sha1 = "0e8bcc235ec8367a8e9648d48325ff00e4b0a545"
uuid = "0ff47ea0-7a50-410d-8455-4348d5de0420"
version = "0.1.5"

[[PlutoTeachingTools]]
deps = ["Downloads", "HypertextLiteral", "LaTeXStrings", "Latexify", "Markdown", "PlutoLinks", "PlutoUI", "Random"]
git-tree-sha1 = "d8be3432505c2febcea02f44e5f4396fae017503"
uuid = "661c6b06-c737-4d37-b85c-46df65de6f69"
version = "0.2.3"

[[PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "2777a5c2c91b3145f5aa75b61bb4c2eb38797136"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.43"

[[Preferences]]
deps = ["TOML"]
git-tree-sha1 = "00cfd92944ca9c760982747e9a1d0d5d86ab1e5a"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.2.2"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[Qt5Base_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Fontconfig_jll", "Glib_jll", "JLLWrappers", "Libdl", "Libglvnd_jll", "OpenSSL_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libxcb_jll", "Xorg_xcb_util_image_jll", "Xorg_xcb_util_keysyms_jll", "Xorg_xcb_util_renderutil_jll", "Xorg_xcb_util_wm_jll", "Zlib_jll", "xkbcommon_jll"]
git-tree-sha1 = "c6c0f690d0cc7caddb74cef7aa847b824a16b256"
uuid = "ea2cea3b-5b76-57ae-a6ef-0a8af62496e1"
version = "5.15.3+1"

[[REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[RecipesBase]]
git-tree-sha1 = "44a75aa7a527910ee3d1751d1f0e4148698add9e"
uuid = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
version = "1.1.2"

[[RecipesPipeline]]
deps = ["Dates", "NaNMath", "PlotUtils", "RecipesBase"]
git-tree-sha1 = "7ad0dfa8d03b7bcf8c597f59f5292801730c55b8"
uuid = "01d81517-befc-4cb6-b9ec-a95719d0359c"
version = "0.4.1"

[[Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "4036a3bd08ac7e968e27c203d45f5fff15020621"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.1.3"

[[Revise]]
deps = ["CodeTracking", "Distributed", "FileWatching", "JuliaInterpreter", "LibGit2", "LoweredCodeUtils", "OrderedCollections", "Pkg", "REPL", "Requires", "UUIDs", "Unicode"]
git-tree-sha1 = "dad726963ecea2d8a81e26286f625aee09a91b7c"
uuid = "295af30f-e4ad-537b-8983-00126c2a3abe"
version = "3.4.0"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[Scratch]]
deps = ["Dates"]
git-tree-sha1 = "0b4b7f1393cff97c33891da2a0bf69c6ed241fda"
uuid = "6c6a2e73-6563-6170-7368-637461726353"
version = "1.1.0"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

[[Showoff]]
deps = ["Dates", "Grisu"]
git-tree-sha1 = "91eddf657aca81df9ae6ceb20b959ae5653ad1de"
uuid = "992d4aef-0814-514b-bc4d-f2e9a6c4116f"
version = "1.0.3"

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

[[StaticArrays]]
deps = ["LinearAlgebra", "Random", "Statistics"]
git-tree-sha1 = "3c76dde64d03699e074ac02eb2e8ba8254d428da"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.2.13"

[[Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[StatsAPI]]
git-tree-sha1 = "1958272568dc176a1d881acb797beb909c785510"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.0.0"

[[StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "LogExpFunctions", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "eb35dcc66558b2dda84079b9a1be17557d32091a"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.33.12"

[[StructArrays]]
deps = ["Adapt", "DataAPI", "StaticArrays", "Tables"]
git-tree-sha1 = "2ce41e0d042c60ecd131e9fb7154a3bfadbf50d3"
uuid = "09ab397b-f2b6-538f-b94a-2f83cf4a842a"
version = "0.6.3"

[[TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.0"

[[TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "LinearAlgebra", "TableTraits", "Test"]
git-tree-sha1 = "fed34d0e71b91734bf0a7e10eb1bb05296ddbcd0"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.6.0"

[[Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[Tricks]]
git-tree-sha1 = "6bac775f2d42a611cdfcd1fb217ee719630c4175"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.6"

[[URIs]]
git-tree-sha1 = "97bbe755a53fe859669cd907f2d96aee8d2c1355"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.3.0"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[Wayland_jll]]
deps = ["Artifacts", "Expat_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "3e61f0b86f90dacb0bc0e73a0c5a83f6a8636e23"
uuid = "a2964d1f-97da-50d4-b82a-358c7fce9d89"
version = "1.19.0+0"

[[Wayland_protocols_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Wayland_jll"]
git-tree-sha1 = "2839f1c1296940218e35df0bbb220f2a79686670"
uuid = "2381bf8a-dfd0-557d-9999-79630e7b1b91"
version = "1.18.0+4"

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
version = "1.2.12+3"

[[Zstd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "cc4bf3fdde8b7e3e9fa0351bdeedba1cf3b7f6e6"
uuid = "3161d3a3-bdf6-5164-811a-617609db77b4"
version = "1.5.0+0"

[[libass_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "HarfBuzz_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "5982a94fcba20f02f42ace44b9894ee2b140fe47"
uuid = "0ac62f75-1d6f-5e53-bd7c-93b484bb37c0"
version = "0.15.1+0"

[[libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.1.1+0"

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
version = "1.48.0+0"

[[p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+0"

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
# ╟─e227c53c-28a1-4d09-bf05-ba24236f613a
# ╟─c27a02b0-2646-4ef2-87a7-668a428ebd98
# ╟─407d58b8-a759-436f-888e-0292cfd0d17d
# ╟─d45dcd85-db5f-4f9e-8f67-a82df904e0dc
# ╟─ed44a647-2ed8-47f3-84d0-3efde79cf276
# ╟─ed4846d5-70d2-4deb-9a4a-41cdc8c99bdd
# ╠═1301d1ad-89e8-4282-ab35-1a6b8214bea0
# ╟─1a427cf6-b2d3-4d9b-9cb5-4682d5f49869
# ╟─e2fc78d6-480b-4fe0-b844-0d4329c0d572
# ╟─8bde3ad9-2d03-4557-ab50-a89ac8e834a3
# ╟─61238dc4-3c9d-4b59-9486-501988806c27
# ╟─c4d5e3f9-7808-48f6-8d33-05607d8e5a4e
# ╟─54da2314-4fa8-483b-9627-9e454c110f3d
# ╟─f6fcec56-b080-4016-baf0-0ab728f255f3
# ╟─d9e431c5-be62-40c8-b5d6-59d5808e4436
# ╟─cde4847b-6c38-4bc6-a869-514774630c89
# ╟─5b4c1912-126d-4fe8-87c5-f65b299f3642
# ╠═1c70002d-e3fb-4d81-b0f9-ed00d69173ff
# ╟─d8d6a6e9-df8d-47d2-832a-0d2126ce760e
# ╟─0ff562ff-7af2-4749-87f5-8766cb695893
# ╟─cf0f089a-1901-4ad1-8fe9-b9028679b109
# ╟─68969be8-0bee-4cca-85de-7a8d2aa35ee2
# ╠═de954f1d-a3ac-4830-acd0-85e64afdf0cd
# ╟─0a35c6dc-0967-4f8a-9fff-904f9062eeab
# ╠═8f5b0bd5-7a65-4ba3-bdd1-7cc3128fa8d8
# ╠═7d6a01a4-4876-42dc-ab66-f7f736d41a32
# ╟─9d82a20f-3a14-4796-88e9-e27720632bbd
# ╟─04b517f9-ed9f-4a5d-929b-82b10de843b9
# ╟─71356175-ffe4-4c3a-a895-8a4be8713a44
# ╠═cfc7844e-3974-46ef-a53a-ee6a1a85d7f3
# ╟─d85a5505-1ab5-43d0-97ad-a0cb4a220c06
# ╟─7c572ab7-2292-423c-b611-68573b289265
# ╟─50022e39-c2f4-455f-8d26-7c9246190b11
# ╠═14ad0875-e27a-442e-81e9-29d1abaeac17
# ╟─4bac08e5-7a7a-496f-8d67-aa2bc4b10236
# ╟─5abe64cf-9291-48d6-bf60-7335551ee791
# ╟─ac32afe0-e30f-402e-995e-8b0cacf8af10
# ╟─4989ff81-ac16-446c-8d8a-e3cb9e5950b6
# ╟─1d458a5a-545f-4ab6-900b-9d84ebbaf51d
# ╟─4652d9e4-e2c6-47c4-93d1-1e360ffb7e57
# ╠═d25759bf-6e81-439c-a2c9-c19704379437
# ╟─4629c049-8882-4823-bdea-93e3d70cc901
# ╟─ea81ca51-dccc-4187-b788-7ed64716e698
# ╠═6030b931-51a0-42fc-9b74-5635b590e6f5
# ╟─d47a90f0-f8bc-44d0-b71c-c0bc59d0d23c
# ╟─3c921729-6534-4eac-abb0-4eb362295b91
# ╠═4da7f391-e3bf-4e12-aa6b-a7ef5e45d3b9
# ╟─a45ad7c2-2f83-4e04-bdaf-8dcc30a150f5
# ╟─5b866db3-ddd6-4bfd-b027-761c07d6755c
# ╟─326135bd-24e3-492d-a7d5-1a14f065e80f
# ╟─df3609ef-80f2-464a-b522-f289ea9344b4
# ╟─f499659c-b042-4002-bb27-980daf8502d4
# ╟─72a079e6-0c41-4c50-9ee2-838d5cc60c85
# ╟─58e9df34-7471-4942-ac06-2505f52875f2
# ╟─f305c434-9d0c-497d-8335-bf25aa80e915
# ╟─0ce81a6e-965c-4dc0-b9f3-f8c09143460e
# ╟─1cd42258-7583-4288-9c6d-4d47facb69e1
# ╟─facb1900-1093-46c7-97b2-187b67e21294
# ╟─6aae7842-4889-4be6-bd1d-eab44c610af8
# ╟─7ad852d3-e3b8-4799-8aae-a52c1ebe34ac
# ╠═b4e5cbd1-c1c1-47e1-a8aa-8fc2ef628e87
# ╟─55397202-48ae-4a3d-a053-9f46e6638560
# ╟─1a154f27-cd9a-4de8-b850-599b5e810811
# ╠═626c5cab-64e2-446c-9d38-f01dde099d3e
# ╟─1c659ae6-1b29-43a5-92f7-30b1f24c3696
# ╟─426c40b4-5fa1-4d8a-b03c-11f3008484f6
# ╟─8dfd7146-2e55-4ea0-8cf2-3557d89e96e1
# ╠═4e4469c8-994d-42c6-b373-8f295768b8b0
# ╟─66e32f84-8b2a-4a3d-81fe-16437ecc3c18
# ╟─60db00b7-c78b-4c26-9530-c62fcfd1bfd2
# ╟─4fdea2ae-3bf8-42cd-bf6f-411eaf8223c3
# ╠═e648310c-8172-4cf0-ab72-f40229ba2577
# ╟─36295cf6-19ba-4240-9806-745ec0bfdccd
# ╟─4919a95d-cd66-401c-af76-6155087462a3
# ╟─8ad59666-3801-44a3-b26a-197a8f60db02
# ╟─babc5b0b-3263-47d5-bd33-56917ece1e6b
# ╟─49cc56bc-bd1e-4e07-9d9c-0ccfaa92e7b0
# ╟─0bda0726-fcf9-491d-ad24-301521cb5892
# ╟─0835d195-7b73-4da2-bd99-a0adb9e893e8
# ╟─5ae2c37a-c117-4ad8-831f-16edb4b9bfbd
# ╠═6b359fc5-ec8d-47ec-89ec-b1b214a37a82
# ╟─f14c87a4-fe11-48ec-b1a1-ccb10da59734
# ╟─8c55b337-aaf5-4ffc-ae2e-44d5158510ee
# ╟─799d4429-92d9-4eb1-8fd2-566eac6919fb
# ╠═476100eb-b723-4fda-944d-a190e56707b1
# ╟─40e406a9-f8eb-4924-a81c-09f6aa08fda2
# ╟─c6f04e71-b018-4507-8ee1-500117cfa1cd
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
