### A Pluto.jl notebook ###
# v0.19.27

#> [frontmatter]
#> chapter = 2
#> section = 6
#> order = 6
#> title = "📝 Teste 27.jan.2023"
#> layout = "layout.jlhtml"
#> tags = ["lecture", "module3"]

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

# ╔═╡ b88eb231-8e1b-4211-bb68-9f3b2b78fb10
using Plots, PlutoUI, PlutoTeachingTools, Roots, Dierckx

# ╔═╡ a90a4742-8d11-466d-8caa-218d90ada25c
ThreeColumn(md"`Test.ACmachines.jl`", md"[![](https://img.shields.io/badge/GitHub_URL-notebook-C09107)](https://github.com/Ricardo-Luis/notebooks/blob/main/ME2/Test.ACmachines.jl)", md"`Last update: 11·09·2023`")

# ╔═╡ 40083415-01b1-4570-bd6a-2c25e4cf4673
md"""
$\textbf{Licenciatura em Engenharia Eletrotécnica }$

$\text{MÁQUINAS ELÉTRICAS 2}$ 

$\textbf{Rep. do 2º Teste (do Exame de Época Normal de 27 de janeiro de 2023)}$ 
---
"""

# ╔═╡ edd5b03d-f897-4af6-8def-7bd29abaee83
TwoColumnWideRight(md"**_English version:_** $(@bind z CheckBox())", md"$(ChooseDisplayMode())")

# ╔═╡ 263cc10b-55d4-47bd-8a6c-dcdacc4cdf3d


# ╔═╡ 0262a34b-95f8-453e-812c-43663d6337b2
md"""
VERSÃO DRAFT !

**To do:**

 $(@bind thing1 CheckBox()) tornar o texto mais didático\
 $(@bind thing2 CheckBox()) do the English version\
 $(@bind thing3 CheckBox()) adicionar bibliografia para algumas questões\
 $(@bind thing4 CheckBox()) circuitos com os métodos das lâmpadas\
 $(@bind thing5 CheckBox()) adicionar comentários nos códigos\
 $(@bind thing6 CheckBox()) tornar a explicação do condensador síncrono interativa, através da modificação do diagrama vetorial\
 $(@bind thing6 CheckBox()) acrescentar linhas P=constante, II-b)\

"""

# ╔═╡ 5a58ddf6-b17e-4c34-bae5-2aa60245a9c3


# ╔═╡ 47a00c38-b9d7-4515-8b4b-3bca0d107e6c
md"""
# I - Alternador síncrono de polos salientes
"""

# ╔═╡ 236fc3f7-321e-44f7-8ab7-18098ff1b22b
md"""
Considere a alimentação de uma carga de $\rm 1MVA$, $cos\varphi=0,7(i)$, por intermédio de uma ligação em paralelo de dois alternadores síncronos trifásicos, em que se consideram desprezáveis as perdas.

|               |         |       |         |       |                  |                 |
|--------------:|--------:|------:|--------:|------:|-----------------:|----------------:|
| Alternador 1: | $\rm 1kV-Y$; | $\rm 50Hz$; | $\rm 750kVA$; | $p=1$;  | $X_s=4,00Ω⁄fase\:\:$    |                 |
| Alternador 2: | $\rm 1kV-Y$; | $\rm 50Hz$; | $\rm 800kVA$; | $p=12$; | $X_d=1,85Ω⁄fase$; | $X_q=1,25Ω⁄fase$ |

"""

# ╔═╡ 9b6e6867-c94e-4e8e-8743-82e51f320901
md"""
# Dados:
"""

# ╔═╡ 1a6abf20-e5d3-436a-bdc2-f99110ce4956
Sₗ, cosφₗ = 1e6, 0.7 												# load data: apparent power, power factor (indutive) 

# ╔═╡ 0084d746-bb78-4575-8ae7-4fbc8e072810
Uc₁, f₁, Sₙ₁, p₁, Xₛ₁ = 1000, 50, 750e3, 1, 4/10		# alternator 1 datasheet

# ╔═╡ d968ea56-b785-4ec4-a3fe-51b8cf46bb0f
Uc₂, f₂, Sₙ₂, p₂, Xd, Xq = 1000, 50, 800e3, 12, 1.85, 1.25	# alternator 2 datasheet

# ╔═╡ cbffc42a-b2d9-4f0a-b0e6-32869e629de4


# ╔═╡ a4aa3362-ce8c-48ba-a840-9e6e8f8718a3
md"""
## a) $X_d$ e $X_q$
**Como se determinam os parâmetros $X_d$ e $X_q$ experimentalmente? Esclareça sucintamente;**
"""

# ╔═╡ 6b429d28-58a9-49d9-b0d4-e48927edb3de
md"""
Ensaio de pequeno escorregamento:
- aplica-se uma tensão reduzida ao estator através de auto-transformador
- aciona-se o rotor a uma velocidade ligeiramente diferente da velocidade de sincronismo
- registam-se num osciloscópio as formas de onda da tensão e da corrente de uma das fases do estator
- Das envolventes às curvas anteriores, calculam-se as reatâncias síncronas segundo os eixos direto e de quadratura:

$X_d=\frac{U_{max}^{env}}{I_{min}^{env}}\quad\quad; \quad\quad X_q=\frac{U_{min}^{env}}{I_{max}^{env}}$ 

"""

# ╔═╡ 1dca324c-2a26-4da8-9e17-f10bc01a7300


# ╔═╡ c5904d62-a2ab-4298-bcb2-a398c89ef77c
md"""
### Calculos aux. ensaio de escorregamento
Apenas para representação da figura!
"""

# ╔═╡ bd4783a6-936c-4700-bbf8-74b632eb8328
#= 
Implementation of "Amplitude Modulation technique" to emulate salient pole synchronous machine slip test:
  - Carriers amplitudes: Ac1, Ac2 [pu]
  - Modulation amplitudes: Am1, Am2 [pu]
  - Carrier frequency: fc = 50 Hz (represents the rotating magnetic field frequency)
  - Modulation frequency: fm [Hz] (represents the double of slip frequency, or the double of the difference between the rotating magnetic field and the rotor speed and in Hz)
=#
Ac1, Ac2, Am1, Am2, fc, fm = 0.3,0.45, 0.04, 0.15, 50, 3

# ╔═╡ b6813c43-a2b4-42f7-85c3-111f6ff48767
begin
	t = 0:0.0001:0.9  	# time span, s
	γ = π/3 			# initial phase, rad
	voltage = Ac1*cos.(2π*fc.*t.+γ) + Am1*cos.(2π*fm.*t.+γ).*cos.(2π*fc.*t.+γ)
	current = Ac2*cos.(2π*fc.*t.+γ.+π) + Am2*cos.(2π*fm.*t.+γ.+π).*cos.(2π*fc.*t.+γ.+π)
	field = Am2*cos.(π*fm.*t.+2γ)
end;

# ╔═╡ 53284387-5f8b-4838-ba77-2c69c58c73eb
begin
	#plot()	# backend for interactive graph
	
	v1=plot(t, voltage, ylims=(-0.4,0.4),
		ylabel="U (pu)", title="Ensaio de pequeno escorregamento")
	
	v2=plot(t, current, ylims=(-0.7,0.7), ylabel="I (pu)")
	
	v3=plot(t, field,  ylims=(-0.3,0.3), ylabel="Uᴶ⁻ᴷ (pu)", xlabel="t (s)")
	
	plot(v1, v2, v3, layout = (3, 1), legend=:false)
end

# ╔═╡ 3bdecd8a-708d-4bbf-811a-4f96e2f011b9
md"""
[Amplitude Modulation](https://www.tutorialspoint.com/analog_communication/analog_communication_amplitude_modulation.htm)


$$s(t)=A_c\left [ 1+\left ( \frac{A_m}{A_c} \right )\cos \left ( 2\pi f_mt \right ) \right ]\cos \left ( 2\pi f_ct \right )$$
"""

# ╔═╡ 039f5f54-872d-41ba-85a4-5c134a1a0c1b


# ╔═╡ 266ad8ad-9fca-415f-b8e6-026c4f481364
md"""
## b) Sequência de fases
**Explique como verifica a sequência de fases no procedimento de colocação dos alternadores em paralelo.**
"""

# ╔═╡ f6d5a921-021e-4ff4-9d75-6e6add431efb
md"""
- Pode-se usar um dos métodos das lâmpadas:
  - modo focos girantes: as lâmpadas acendem e apagam à vez
  - modo focos em extinção: as lâmpadas acendem e apagam simultaneamente 

Se num destes modos o comportamento das lâmpadas não corresponder ao esquema implementado é necessário proceder à troca de quaisquer 2 fases.

- em alternativa pode-se usar um sequencímetro, verificando à vez, em cada alternador a sua sequência de fases. 

"""

# ╔═╡ b00d70d1-a7fd-4c7f-90fe-a8722ad50b31


# ╔═╡ 26e6b2e7-ec1e-456e-848e-57af1f0a27dd
md"""
## c-1) Cálculo de $\bar{E_0}$ 
**Para uma repartição equitativa de carga, determine a força eletromotriz do alternador 2.**
"""

# ╔═╡ ff8ce092-49a1-4165-b621-246ad4335c81


# ╔═╡ 4e19252c-ab26-404f-b0da-4449fd0450b7
begin
	Iₗ₂ = (Sₗ/2) / (√3 * Uc₂)
	Iₗ₂ = round(Iₗ₂, digits=1) 		# A, line current for each alternator
end

# ╔═╡ e9074cf1-9a24-451e-aa64-cd948b15f9b6
begin
	φ₂ = -acos(cosφₗ)
	φ₂ = rad2deg(φ₂)
	φ₂ = round(φ₂, digits=1)
end

# ╔═╡ 253bfa2d-233a-4320-b8df-bdffd5501c43


# ╔═╡ 48c57f54-1cb3-43af-a853-f778d5f37ad8
md"""
## c-2) Diagrama vetorial de tensões 
**Trace qualitativamente o diagrama vetorial  para o alternador 2.**
"""

# ╔═╡ 0c8e08b0-2a1f-43f1-9bfa-a4a31d255ade


# ╔═╡ 9b1449bf-64d5-482c-9504-96a1638c8f62
md"""
## d) 💻  $\:U, \:f, \:Q, \:P$
**Quais os procedimentos a adotar neste paralelo de alternadores síncronos, para manter constantes a tensão, frequência e a repartição de carga, se a amplitude da corrente na carga paulatinamente aumentar? Justifique qualitativamente, apresentando gráficos que relacionem: U, f, Q, P**
"""

# ╔═╡ d21bcd53-f213-46cc-8e11-cfa336bf98aa
md"""
Considerando os alternadores acionados por turbinas de características iguais, permite assumir curvas de $f_1(P_1)$ e $f_2(P_2)$ iguais, considerando que os reguladores de frequência são idênticos. Assim, por exemplo, considerando um estatismo de $5\rm Hz/MW$ de cada regulador-turbina, podemos transformar esta questão qualitativa, numa questão quantitativa tirando partido do cálculo computacional para ilustrar graficamente o problema.
"""

# ╔═╡ f1cdf6dd-e704-4eec-8a01-92ee3965d626
md"""
 $\text{Alternadores 1 e 2, potência mecânica (pu):}\quad$ $(@bind Kmec PlutoUI.Slider(0.7:0.001:1.2, default=1.00,show_value=true))
"""

# ╔═╡ e993f8a1-5662-4f3b-b51b-8e0ef1fec76d


# ╔═╡ 5bf619b1-8756-4efd-9104-ea7bf7bcd079
md"""
Os alternadores considerados neste exercício têm parâmetros construtivos diferentes, por conseguinte, as curvas características $U_1(Q_1)$ e $U_2(Q_2)$ são diferentes. Tome-se como ponto de partida, a situação descrita em que repartem a carga reactiva de igual modo. Também aqui, podemos transformar esta questão qualitativa, numa questão quantitativa tirando partido do cálculo computacional para ilustrar graficamente o problema.
"""

# ╔═╡ 72c821fe-33e9-46a9-8414-076f14b7ab3f
md"""
 $\text{Ativar linhas de apoio para repartição equitativa de carga:}\quad$ $(@bind K3 CheckBox(default=false))
"""

# ╔═╡ 974731dd-ca12-42b8-9f82-9d1337cf319c
md"""
 $\text{Alternador 1, corrente de excitação (pu):}\quad$ $(@bind K1 PlutoUI.Slider(0.5:0.001:1.4, default=1,show_value=true))

 $\text{Alternador 2, corrente de excitação (pu):}\quad$ $(@bind K2 PlutoUI.Slider(0.5:0.001:1.4, default=1,show_value=true))
"""

# ╔═╡ 4eac8988-f5c8-44d5-8fad-2b127d55bc3c


# ╔═╡ dc9f5db7-38dc-4d41-a9de-b29b2ab6fb0f
md"""
!!! nota
	Neste exercício interativo, o estudante deverá compreender como atuar nos grupos alternadores para manter a frequência, tensão e repartição de carga constantes, quando a amplitude da corrente aumenta. 
		"""

# ╔═╡ 9c25ef0d-bfd4-4957-80a3-ff6a6fe9f858


# ╔═╡ 849a11aa-b172-428c-8b9a-a49879d70f80
md"""
### Cálulos auxiliares:
"""

# ╔═╡ a3a183a1-383d-446f-9ed4-c2925398061b
md"""
> Não necessita de preocupar-se em perceber esta secção em detalhe!
"""

# ╔═╡ 69d15fb8-85f8-4bec-a647-dc07afc8ba3c
begin
	Iₗ=Sₗ/(√3*Uc₁)
	Iload=0:Iₗ/100:3*Iₗ 				# total load variation
end;

# ╔═╡ cddb2d07-a783-4897-a7dd-1e81cdd86df0
md"""
#### $f(P)$
"""

# ╔═╡ 661f99ef-de1c-4b53-a26d-e07e92badc52
begin
	Pₗ = Sₗ*cosφₗ/1e6 		 	# MW, load active power
	fₗ = 50 					# Hz, desired frequency of the load/grid
	sₚ = 5 						# Hz/MW, frequency slope of the prime-mover
	f₀ = sₚ * (Pₗ/2) + fₗ       # Hz, no-load frequency (half-load is considered for each alternator)
end

# ╔═╡ a99ee5e5-334f-4125-9032-f14b070373cc
md"""
 $P,\: \text{carga ativa total (MW):}\quad$ $(@bind P PlutoUI.Slider(0:0.01:2, default=Pₗ,show_value=true))
"""

# ╔═╡ a752ef6e-b021-437c-9942-fa44887ee3d9
begin
	Pₗ₂ = √3*Uc₂*cosφₗ.*(Iload*0.5)/1e6
	fₗ₂ = f₀ .- sₚ .* Pₗ₂
	Pₗ₁ = - Pₗ₂ 
	fₗ₁ = f₀ .+ sₚ .* Pₗ₁
end;

# ╔═╡ f083fcc7-d4d6-49ba-a6cf-27417a9d2a32
begin
	fₚ = f₀ - sₚ*P/2
	fₚ = round(fₚ, digits=2)
end;

# ╔═╡ 12fb6b85-6e04-4dbc-bb04-6ff10e2da2f5
md"""
 $$\quad f=$$ $(fₚ) $$\rm Hz\quad$$ $$\quad P_1=P_2=$$ $(P/2) $$\rm MW$$
"""

# ╔═╡ ff6964bd-9f21-42c2-8f15-c6b30330c169
begin
	fₗ₂ʼ = f₀*Kmec .- sₚ .* Pₗ₂
	fₗ₁ʼ = f₀*Kmec .+ sₚ .* Pₗ₁
	fₚʼ = f₀*Kmec - sₚ*P/2
	fₚʼ = round(fₚʼ, digits=2)
end;

# ╔═╡ c71d7953-dc87-4f39-bc50-e76a63a53fcf
begin
	# f(P) alternator prime-mover curves
	plot(Pₗ₁, fₗ₁, framestyle=:zerolines, linewidth=2, linecolor=:red, 
		label="f₁ = f(P₁)", xlim=[-1,1], ylim=[0,60],
		xticks=(-1:0.2:1, [1 0.8 0.6 0.4 0.2 0 0.2 0.4 0.6 0.8 10]))
	plot!(Pₗ₂, fₗ₂, linewidth=2, linecolor=:blue, label="f₂ = f(P₂)", 
		ylabel="f (Hz)", xlabel="P (MW)")

	#Initial conditions: line markers for each alternator with 50% of load @ 50Hz
	plot!([-Pₗ/2, Pₗ/2],  seriestype = :vline,
		linestyle=:dashdot, linecolor=:black, label=:none)
	plot!([fₗ],  seriestype = :hline,
		linestyle=:dashdot, linecolor=:black, label=:none)

	# effect of load variation:
	plot!([fₚ], seriestype = :hline,
		linestyle=:dash, linecolor=:black, label=:none)
	plot!([-P/2, P/2],  seriestype = :vline,
		linestyle=:dash, linecolor=:black, label=:none)

	# frequency correction with equity load sharing

	plot!(Pₗ₁, fₗ₁ʼ, linewidth=2, linecolor=:red, linestyle=:dash,
		label="f'₁ = f(P₁)")
	plot!(Pₗ₂, fₗ₂ʼ, linewidth=2, linecolor=:blue, linestyle=:dash, 
		label="f'₂ = f(P₂)")
	
end

# ╔═╡ 75e477a5-e856-4ad6-a659-ac02e58ecf8a
md"""
 $$\quad f'=$$ $(fₚʼ) $$\rm Hz\quad$$ $$\quad P'_1=P'_2=$$ $(P/2) $$\rm MW$$
"""

# ╔═╡ 57c7d7f0-0b06-4f3f-8403-e8867b6f4fc4
md"""
#### $U(Q)$
"""

# ╔═╡ 5ce13622-87c3-40ed-97a2-58591f6f9514


# ╔═╡ 55b1dd0d-8a3c-45b5-8681-7388fdcc7de5
md"""
## e) Condensador síncrono
**Explique sucintamente o que é um condensador síncrono. Considere que o alternador 2 é colocado nessa função e trace qualitativamente o novo diagrama vetorial correspondente**
"""

# ╔═╡ 76db2f36-7b1c-4472-a3e6-ca1c4520b28e
md"""
Condensador síncrono == motor em vazio sobreexcitado (gera indutiva/consome capacitiva)
"""

# ╔═╡ 882151a2-8110-4829-9b4b-f6a47e9aa6be


# ╔═╡ b8492061-7322-4af8-a885-1dbbb36f2f36
md"""
# II - Motor síncrono 3~ de polos lisos
"""

# ╔═╡ 52f3510a-0d30-4794-8ea7-c9dce2a214e0
md"""
**Considere um motor síncrono trifásico tetrapolar, $315\rm kW$, $\:690/400\rm V - 50\rm Hz$, $\:\eta=92\%$, $\:\rm cos\:\varphi=0,85(\rm c)$, ligado em triângulo a uma rede elétrica de $\:U, f\:$ constantes. A resistência estatórica é desprezável e apresenta uma reatância síncrona de $\:1,2\rmΩ/fase$.**
"""

# ╔═╡ aac2ef1d-67b8-4cee-a5ec-b0fb6c257455


# ╔═╡ 5f5d43aa-766d-4bb8-bcf9-4cb76b34c6bc
md"""
# Dados:
"""

# ╔═╡ 0f0a91cc-922e-4788-857c-156859f63f0e
Pᵤ, Uₛₜₐᵣ, U▵, f, η, cosφ, R, Xₛ = 315e3, 690, 400, 50, 0.92, 0.85, 0, 1.2

# ╔═╡ a21fe332-d5f1-4fff-90ab-95380fa29ae4


# ╔═╡ 693a2aae-fc42-43d5-8745-2b397892a7a0
md"""
## a) Cálulo de $\bar{E'_0}$ 
**Com o motor a operar nas condições nominais, determine o vetor da força eletromotriz e trace qualitativamente o diagrama vetorial correspondente;**
"""

# ╔═╡ fbb03be0-96c7-4114-9b7e-80fef92bd804


# ╔═╡ 8b14d6b5-6aac-4507-8ae8-1b2823b314fd
md"""
## b) 💻 Diagramas vetoriais 
**Trace qualitativamente o diagrama vetorial de tensões correspondente à situação nominal e apresente nos eixos relativos a $P(\delta)\:$ e $\:Q(\delta)$ o ponto de funcionamento;** 

**Suponha agora uma redução em 50% na corrente de campo. Trace qualitativamente e sobreposto ao diagrama anterior, um novo diagrama vetorial referente a esta modificação e apresente nos eixos relativos a $P(\varphi)$ e $Q(\varphi)$ o novo ponto de funcionamento.**
"""

# ╔═╡ a25f59a4-d20b-49d6-ac6f-53899279f9a7
md"""
 $\text{Corrente de excitação (pu):}\quad$ $(@bind Kc PlutoUI.Slider(0.488:0.001:1.8, default=0.5,show_value=true))
"""

# ╔═╡ bd899d78-df7b-4770-b43a-965ab1ac11e0


# ╔═╡ 7b68f211-36b3-4577-9d9e-763b14ef95d7
md"""
## c) 💻 Critério de igualdade das áreas
**O limite de estabilidade dinâmica, ou de grandes variações, é encontrado através do critério de igualdade das áreas. Desenvolva a equação (sem resolver os integrais) e as relações que permitem encontrar a potência limite a aplicar à máquina síncrona, sabendo que esta se encontra inicialmente em vazio, com tensão nominal.**
"""

# ╔═╡ 8ece1d58-d4aa-441f-ae69-d25685670472


# ╔═╡ 3718458e-0f67-42cd-a27d-317ee0906145
md"""
 $$P_{lim},\:\rm kW:$$ $(@bind Pₗᵢₘ PlutoUI.Slider(1:1:350, default=150, show_value=true))
"""

# ╔═╡ 1dca9b65-07bf-4c52-b691-65ae0147887c
md"""
Aplicando o critério da igualdade das áreas, $$A_1 = A_2$$, escrevem-se as equações de cálculo das áreas igualando-as, de modo a obter uma equação final, que apresenta uma única incógnita, $$\delta_{lim}$$, que satisfaz a igualdade das áreas.
"""

# ╔═╡ d81ab12b-6339-477c-b69c-0981ca04d1d2
md"""
Aproveitando o cálculo computacional, estendeu-se esta questão para obter solução do problema, resolvendo os integrais. Assim, tem-se:
"""

# ╔═╡ fd41f976-4b92-4009-b353-9db4161b6223
md"""
$$\begin{aligned} 

A_1 &= A_2 \\
\\
P_{lim} \delta_{lim}- \int_{0}^{\delta_{lim}} P(\delta) \; \rm{d}\delta &= \int_{\delta_{lim}}^{\pi-\delta_{lim}} P(\delta) \; \rm{d}\delta - P_{lim}(\pi- 2\delta_{lim}) \\
\\
(P_{max} \sin\delta_{lim})\delta_{lim} - P_{max}\int_{0}^{\delta_{lim}}\sin\delta \; \rm{d}\delta &= P_{max}\int_{\delta_{lim}}^{\pi-\delta_{lim}} \sin\delta \; \rm{d}\delta - (P_{max} \sin\delta_{lim})(\pi- 2\delta_{lim}) \\
\\
(\sin\delta_{lim})\delta_{lim} - [-\cos\delta]_{0}^{\delta_{lim}} &= [-\cos\delta]_{\delta_{lim}}^{\pi-\delta_{lim}} - (\sin\delta_{lim})(\pi- 2\delta_{lim}) \\
\\
(\sin\delta_{lim})(\pi -\delta_{lim}) - 1 +  \cos(\pi-\delta_{lim}) &=0 \\

\end{aligned}$$
"""

# ╔═╡ 8330caa4-d7b9-476b-92d9-38f0b64af425
md"""
Definindo uma função, $$g(\delta)$$: 

$$g(\delta) = (\sin\delta_{lim})(\pi -\delta_{lim}) - 1 +  \cos(\pi-\delta_{lim})$$

A resolução da equação que satisfaz o critério de igualdade das áreas consiste em encontrar a raíz para $$g(\delta)=0$$:
"""

# ╔═╡ 706c07f0-eebb-4f71-8a4d-3093b1c79af9
begin
	# função a determinar a raíz: f(δ), [package: Roots.jl]
	g(δa) = (sin(δa))*(π-δa)-1+cos(π-δa)
end;

# ╔═╡ a19492ac-cc05-4f3b-9789-4f6cee8d9439
begin
	 # Calculation of δ that gives equal areas [package: Roots.jl]
	 δₛₒₗ=find_zero(g, (0, π/2))	# find g(δ)=0 betweem δᵢ to π/2, [Roots.jl]
	 δₛₒₗ=rad2deg(δₛₒₗ)
	 δₛₒₗ=round(δₛₒₗ, digits=2)
 end;

# ╔═╡ 714edc82-b6f7-4b88-b345-c9578f83ff30
md"""
A determinação da raíz para $$f(\delta)$$ corresonde à solução do critério da igualdade das áreas, $$A_1$$ e $$A_2$$.

Assim, com recurso a método numérico computacional, o ângulo de carga correspondente a $$f(\delta)=0$$, vem dado por: $$\delta_{lim}=$$ $δₛₒₗ $$°$$.
"""

# ╔═╡ e178a306-05a2-4fcb-8101-db1d4fd11cf4


# ╔═╡ 04c34d5b-7cb9-418a-84a5-6ec900cefa58
md"""
---
`ISEL/DEEEA/GDME/Máquinas Elétricas II`
"""

# ╔═╡ d6c33c3b-3823-4091-a397-5b78212d33d4


# ╔═╡ 53087350-c94f-41e3-a0e3-9ad6a54f1d7e
md"""
# Notação complexa
"""

# ╔═╡ 0ca024ef-9fe9-41e6-a87e-feaddc80191f
j = Base.im   													# to use "j" as imaginary unit instead the Julia default "im"

# ╔═╡ aecd1555-ed11-4ab0-ad3d-98ada78f45a7
∠(θ) = cis(deg2rad(θ)) 											# to use phasor notation (with angle in degrees )

# ╔═╡ 052e8a6e-dd54-4079-b112-6b5275cfd6bb
begin
	I₂ = Iₗ₂
	I⃗₂ = (Iₗ₂)∠(φ₂)
	
	U⃗₂ = (Uc₂/√3)∠(0)   			# Y connection
	U₂ = abs(U⃗₂)
	U₂ = round(U₂, digits=1)
	Text("U⃗₂=$(U₂)V∠$(0)°")
end

# ╔═╡ d4defde1-3d5f-4473-b9f6-24322d92fdd8
begin
	E⃗₂ = U⃗₂ + j*Xq*I⃗₂
	E₂ = abs(E⃗₂)
	E₂ = round(E₂, digits=1)
	δ₂ = angle(E⃗₂)
	δ₂ = rad2deg(δ₂)
	δ₂ = round(δ₂, digits=1)
	Text("E⃗₂=$(E₂)V∠$(δ₂)°")
end

# ╔═╡ c0c59b61-943e-4ed0-935c-ec5cdf665b0d
begin
	I⃗d = (I₂*sind(abs(φ₂)+δ₂))∠(δ₂-90)
	Id = abs(I⃗d)
	Id = round(Id, digits=1)
	d_axis = angle(I⃗d)
	d_axis = rad2deg(d_axis)
	d_axis = round(d_axis, digits=1)
	Text("I⃗d=$(Id)A∠$(d_axis)°")
end

# ╔═╡ b44937d1-b83a-417b-a153-679d388adb59
begin
	E⃗₀₂ = E⃗₂ + j*(Xd-Xq)*I⃗d
	E₀₂ = abs(E⃗₀₂)
	E₀₂ = round(E₀₂, digits=1)
	let δ₂ = angle(E⃗₀₂)
		δ₂ = rad2deg(δ₂)
		δ₂ = round(δ₂, digits=1)
		Text("E⃗₀₂=$(E₀₂)V∠$(δ₂)°")
	end
end

# ╔═╡ 3398ead4-b619-4215-a05c-b68399c20c53
begin
	Qload⁵⁰=abs.(√3*Uc₂*Iload*0.5*sin(φ₂*π/180))/1000  #kVAr

	m2 = (E₀₂-Uc₂)/(-Qload⁵⁰[51])
	Uₐ₂=m2.*Qload⁵⁰ .+ E₀₂

	U2_int = Spline1D(Qload⁵⁰,Uₐ₂)
end;

# ╔═╡ 71e8be35-232f-4772-aca7-defe3cac3cd0
md"""
 $Q,\: \text{carga reativa total (kVAr):}\quad$ $(@bind Q PlutoUI.Slider(124:1:1400, default=2*Qload⁵⁰[51],show_value=true))
"""

# ╔═╡ 06f9ce73-97b1-4323-8960-e8616d1f8af1
begin

	# d, q axis:
	plot([0+j*0, (1100*cosd(δ₂))+j*1100*sind(δ₂)], 
		label="eixo de quadratura", arrow=:head, linecolor=:black, linewidth=2)
	plot!([0+j*0, (400*cosd(δ₂-90))+j*400*sind(δ₂-90)],
		label="eixo direto", arrow=:head, linecolor=:black, linewidth=2, linestyle=:dashdot)
	
	# E⃗':
	K=1 							# scale factor for the current vector
	jXqI⃗₂ = (Xq*I₂)∠(φ₂+90)
	plot!([0, U⃗₂], arrow=:closed, legend=:bottomright, label="U₂∠0°")
	plot!([0, K*I⃗₂], arrow=:closed, label="I₂∠φ₂")
	plot!([U⃗₂, U⃗₂+jXqI⃗₂], arrow=:closed, label="XqI₂∠(φ+90°)")
	plot!([0, E⃗₂], arrow=:closed, minorticks=5, label="E₂∠δ₂",
		  ylims=(-500,600), xlims=(0,1100), size=(600,600))

	# I⃗d
	plot!([0, I⃗d],arrow=:closed, label="Id∠(δ₂-90°)")
	
	#E⃗₀:
	plot!([E⃗₂, E⃗₂ + j*(Xd-Xq)*I⃗d], 
			arrow=:closed, label="(Xd-Xq)Id∠(δ₂)", linewidth=2)
	
	plot!([0, E⃗₀₂], arrow=:closed, label="E₀∠δ₂", linewidth=3)		
end

# ╔═╡ 1e113a09-77c3-44f2-af30-72a587396cb7
begin
	U⃗₁ = (Uc₁)∠(0)
	E⃗₀₁ = U⃗₁ + j*Xₛ₁*I⃗₂
	E₀₁ = abs(E⃗₀₁)
	E₀₁ = round(E₀₁, digits=1)

	m1 = (Uc₁-E₀₁)/(-Qload⁵⁰[51])
	Uₐ₁=m1.*(-Qload⁵⁰) .+ E₀₁

	U1_int = Spline1D(Qload⁵⁰,Uₐ₁)
end;

# ╔═╡ 1197f2e8-161b-4416-a8e8-621f7ebe3d6b
begin
	Q2 = (-m1*Q + E₀₁ - E₀₂)/(-m1+(m2))
	Q2=round(Q2, digits=1)
	
	U2=U2_int(Q2)
	U2=round(U2, digits=0)
end;

# ╔═╡ de8110e6-3caf-4169-9af9-55783689bc8c
begin
	Q1 = (abs(m2)*Q + abs(E₀₂ - E₀₁))/(m1+abs(m2))
	Q1=round(Q1, digits=1)

	U1=U1_int(Q1)
	U1=round(U1, digits=0)
end;

# ╔═╡ 14389231-1876-4015-8f1d-d7f5fa41a04c
md"""
 $$\quad U=$$ $(U1) $$\rm V\quad$$ $$\quad Q_1=$$ $(Q1) $$\rm kVAr\quad$$ $$\quad Q_2=$$ $(Q2) $$\rm kVAr\quad$$
"""

# ╔═╡ 2b7d5e66-78cb-43dc-884f-1df1a745764f
begin
	#Voltage correction:
	Uₐ₁ʼ=m1.*(-Qload⁵⁰) .+ K1*E₀₁
	Uₐ₂ʼ=m2.*Qload⁵⁰ .+ K2*E₀₂

	U1_intʼ = Spline1D(Qload⁵⁰,Uₐ₁ʼ)
	U2_intʼ = Spline1D(Qload⁵⁰,Uₐ₂ʼ)
end;

# ╔═╡ f164a7e0-2923-4154-802d-8128f5b06450
begin
	#Initial conditions: each alternator with 50% of load @ 1000V
	plot(Qload⁵⁰, Uₐ₂, xticks=(-1000:200:1000, 100*[10 8 6 4 2 0 2 4 6 8 10]),
		linewidth=2, linecolor=:blue, framestyle=:zerolines, xlim=[-1000,1000], label="U₂ = f(Q₂)")
	plot!(-Qload⁵⁰, Uₐ₁, ylim=[0,1600], linewidth=2, linecolor=:red, 
		yticks = 0:200:1600, label="U₁ = f(Q₁)")
	plot!([-Qload⁵⁰[51]], seriestype = :vline, 
		linestyle=:dashdot, linecolor=:black, label=:none)
	plot!([Qload⁵⁰[51]], seriestype = :vline, 
		linestyle=:dashdot, linecolor=:black, label=:none)
	plot!([1000], seriestype = :hline, 
		linestyle=:dashdot, linecolor=:black, label=:none, 
		ylabel="U (V)", xlabel="Q (kVAr)")
	
	# Load variation lines:
	plot!([-Q1], seriestype = :vline, 
		linestyle=:dash, linecolor=:black, label=:none)
	plot!([Q2], seriestype = :vline, 
		linestyle=:dash, linecolor=:black, label=:none)
	plot!([U2], seriestype = :hline, 
		linestyle=:dash, linecolor=:black, label=:none)

	# Voltage correction/reactive load sharing:
	plot!(-Qload⁵⁰, Uₐ₁ʼ, linewidth=2,linecolor=:red, linestyle=:dash, label="U'₁ = f(Q'₁)")
	plot!(Qload⁵⁰, Uₐ₂ʼ, 
		linewidth=2, linecolor=:blue, linestyle=:dash, label="U'₂ = f(Q'₂)")
	plot!([-Q*K3/2, K3*Q/2], seriestype = :vline, 
		linestyle=:dash, linecolor=:green, label=:none)	
end

# ╔═╡ 075c639a-57cc-4bde-8079-9a61efad740d
begin
	Q2ʼ = (-m1*Q + K1*E₀₁ - K2*E₀₂)/(-m1+(m2))
	Q2ʼ = round(Q2ʼ, digits=1)
	
	U2ʼ = U2_intʼ(Q2ʼ)
	U2ʼ = round(U2ʼ, digits=0)

	Q1ʼ = (abs(m2)*Q + abs(K2*E₀₂ - K1*E₀₁))/(m1+abs(m2))
	Q1ʼ = round(Q1ʼ, digits=1)

	U1ʼ = U1_intʼ(Q1ʼ)
	U1ʼ = round(U1ʼ, digits=0)
end;

# ╔═╡ b13cc67a-5ff9-4918-8b8e-13fb3b0e452e
md"""
 $$\quad U'=$$ $(U1ʼ) $$\rm V\quad$$ $$\quad Q=$$ $(Q) $$\rm kVAr\quad$$ $$\quad Q_1'=$$ $(Q1ʼ) $$\rm kVAr\quad$$ $$\quad Q_2'=$$ $(Q2ʼ) $$\rm kVAr\quad$$
"""

# ╔═╡ 21ab727a-d417-4728-9ceb-706789fc37b9
begin

	# synchronous condenser:
	δ₃= 0
	I⃗₃= (I₂)∠(90)
	I₃ = abs(I⃗₃)
	I⃗d₃= I⃗₃
	E⃗₃ = U⃗₂ - j*Xq*I⃗₃
	E⃗₀₃= E⃗₃ - j*(Xd-Xq)*I⃗d₃


	# d, q axis:
	plot([0+j*0, (1300*cosd(δ₃))+j*1100*sind(δ₃)], 
		label="eixo de quadratura", arrow=:head, linecolor=:black, linewidth=1)
	plot!([0+j*0, (500*cosd(δ₃+90))+j*500*sind(δ₃+90)],
		label="eixo direto", arrow=:head, linecolor=:black, linewidth=1, linestyle=:dashdot)
		
	#E⃗₀:
	plot!([0, E⃗₀₃], arrow=:open, label="E₀∠δ₂", linecolor=:lightgrey, linewidth=8)		
	
	plot!([E⃗₃, E⃗₃ - j*(Xd-Xq)*I⃗d₃], 
			arrow=:closed, label="(Xd-Xq)Id∠(δ₂)", linewidth=2)

	# I⃗d
	plot!([0, I⃗d₃],arrow=:open, label="Id∠(δ₂-90°)=I₂∠φ₂", linewidth=6, linecolor=:orange)
	
	# E⃗':
	plot!([0, E⃗₃], arrow=:closed, minorticks=5, label="E'₂∠δ₂", linewidth=2,
		  ylims=(-500,1000), xlims=(-100,1400), size=(600,600))
	
	jXqI⃗₃ = (Xq*I₃)∠(180)
	plot!([U⃗₂, U⃗₂-jXqI⃗₃], arrow=:closed, label="XqI₂∠(φ-90°)", linewidth=2)
	
	plot!([0, U⃗₂], arrow=:closed, legend=:topright, linewidth=2, label="U₂∠0°")
	plot!([0, I⃗₃], arrow=:closed, label="I₂∠φ₂", linewidth=2)

end

# ╔═╡ fe7a2fe7-40f5-412c-83f9-1e7084809cb0
begin
	Iₙ = Pᵤ/(η*√3*U▵*cosφ) 						# line current, A
	Iₙ = round(Iₙ, digits=1)
	φ = acos(cosφ)
	φ = rad2deg(φ)
	φ = round(φ, digits=1)
	I⃗ₙ = (Iₙ)∠(φ) 								# line current vector, A
	Text("I⃗ₙ = $(Iₙ)A ∠$(φ)°")
end

# ╔═╡ fd7ecd4b-a8f8-4809-9f36-505494221a70
begin
	U⃗ = (U▵)∠(0) 				# phase voltage vector (Delta connection), V
	I⃗ = I⃗ₙ/√3 					# Delta current (Delta connection), A
	I = abs(I⃗)
	I = round(I, digits=1)
	Text("U⃗ = $(U▵) V ∠$(0)°"), Text("I⃗ = $(I) A ∠$(φ)°")
end

# ╔═╡ 8592168c-5e8d-43d4-8c33-b73c836223a7
begin
	E⃗₀ʼ = U⃗ - j*Xₛ*(I⃗)
	
	E₀ʼ = abs(E⃗₀ʼ)
	E₀ʼ = round(E₀ʼ, digits=1)
	δ = angle(E⃗₀ʼ)
	δ = rad2deg(δ)
	δ = round(δ, digits=1)
	Text("E⃗₀ʼ = $(E₀ʼ)V ∠$(δ)°")
end

# ╔═╡ 32016778-0b66-4a0c-82f8-1c1f0e562d8b
begin
	E₀₁ʼ = E₀ʼ*Kc 
	E₀₁ʼ = round(E₀₁ʼ, digits=1)
end

# ╔═╡ 82941af9-9cf9-4b92-b308-ad1db029fa72
begin
	δₗ=0:0.1:180 				# valores de δ para realização dos gráficos, [°]
	δ₀=0	
	Pₘₐₓ=3*U▵*E₀₁ʼ/Xₛ 			# potência máxima para δ=90°, [W]
	δₗᵢₘ=asin(Pₗᵢₘ*1000/Pₘₐₓ)	# δ para a potência escolhida, [rad]
	δₗᵢₘ=rad2deg(δₗᵢₘ)			# δ para a potência escolhida, [°]
	δₗᵢₘ=round(δₗᵢₘ, digits=2)	
	Pd(δₗ)=Pₘₐₓ*sin(δₗ*π/180)	# função potência desenvolvida, [W]

	# Gráfico:
	plot(δₗ -> Pd(δₗ), 0, δₗᵢₘ, 
		linewidth=3, linecolor=:blue, label="P(δ)", 
		ylabel="P (W)", xlabel="δ (°)", xlims=(0,210), ylims=(0,1.2*Pₘₐₓ),
		title="Aplicação do critério da igualdade das áreas")
	
	plot!(δₗ -> Pd(δₗ), 0, δₗᵢₘ, fillrange = Pₗᵢₘ*1000,
		linewidth=3, linecolor=:blue, fillcolor=:green, label=false)
	
	plot!([Pₗᵢₘ*1000], seriestype=:hline,
		linewidth=2, linecolor=:red, label="Pₗᵢₘ=$Pₗᵢₘ W")
	
	plot!(δₗ -> Pd(δₗ), δₗᵢₘ, 180-δₗᵢₘ, fillrange = Pₗᵢₘ*1000,
		linewidth=3, linecolor=:blue, label=false, fillcolor=:grey)
	
	plot!(δₗ -> Pd(δₗ), 180-δₗᵢₘ, 180,
		linewidth=3, linecolor=:blue, label=false)
	
	plot!([δₗᵢₘ], seriestype=:vline, label="δₗᵢₘ=$δₗᵢₘ °",
		linewidth=1, linecolor=:red, linestyle=:dash) 
end

# ╔═╡ 8bf55f99-3cfb-4ffc-95d2-367fb213f3a5
begin
	Pₛₒₗ=(1/1000)Pd(δₛₒₗ)
	Pₛₒₗ=round(Pₛₒₗ, digits=2)
end;

# ╔═╡ bfd3608d-6aa2-4891-be71-cd809ce71dc6
md"""
Substituindo $$\delta_{lim}$$ na expressão da potência desenvolvida, $$P(\delta)$$, obtém a potência admissível pela máquina síncrona em regime de grandes perturbações, $$P_{lim}=$$ $Pₛₒₗ $$\rm{kW}$$, quando esta se encontra a funcionar em regime nominal.
"""

# ╔═╡ 377458d9-a00e-45af-9f4b-d8961bca5f89
begin
	δ₁ = asin((E₀ʼ/E₀₁ʼ)*sin(δ*π/180))
	δ₁ = rad2deg(δ₁)
	δ₁ = round(δ₁, digits=1)
end

# ╔═╡ 084f8cb6-dba4-452f-86cb-7a19117185ff
begin
	E⃗₀₁ʼ= (E₀₁ʼ)∠(δ₁)
	Text("E⃗₀₁ʼ = $(E₀₁ʼ)V ∠$(δ₁)°")
end

# ╔═╡ 8ff2dca1-b7fc-4597-8fb3-30d6d848c8f3
begin
	I⃗₁ = (U⃗ - E⃗₀₁ʼ)/(j*Xₛ)
	I₁ = abs(I⃗₁)
	I₁ = round(I₁, digits=1)
	φ₁ = angle(I⃗₁)
	φ₁ = rad2deg(φ₁)
	φ₁ = round(φ₁, digits=1)
	Text("I⃗₁ = $(I₁)A ∠$(φ₁)°")
end

# ╔═╡ 336eef9b-b608-43d7-b36f-d282371fecea
begin
	
	# axis: kW, kVAr
	plot([0+j*0, 1000+j*0], label="eixo Q(δ)", arrow=:head, 
		linecolor=:black, linewidth=1)
	plot!([U▵-j*U▵, U▵+j*U▵], label="eixo P(δ)", arrow=:head,
		linestyle=:dash, linecolor=:black, linewidth=2)

	plot!([0+j*0, -100+j*0], label="eixo P(φ)", arrow=:head,
		linecolor=:lightgray, linewidth=1)
	plot!([0-j*U▵, 0+j*U▵], label="eixo Q(φ)", arrow=:head,
		linestyle=:dash, linecolor=:lightgray, linewidth=2)
	
	
	
	Kb = 1/1.3 # factor de escala da corrente
	jXₛI⃗ = (Xₛ*I)∠(φ+90)
	plot!([0, U⃗], arrow=:closed, linecolor=:blue, linewidth=2, 
		legend=:topright, label="U∠0°")
	plot!([0, Kb*I⃗], arrow=:closed, linecolor=:red, linewidth=2, linestyle=:dash, 		label="I∠φ")
	plot!([U⃗, U⃗-jXₛI⃗], arrow=:closed, linecolor=:green, linewidth=2, linestyle=:dash,
		label="XₛI∠(φ+90°)")
	plot!([0, E⃗₀ʼ], arrow=:closed, linecolor=:magenta, linewidth=2, linestyle=:dash,
		minorticks=5, label="E'₀∠δ", ylims=(-600,900), xlims=(-200,1300), size=(600,600))

	plot!([0, Kb*I⃗₁], arrow=:closed, linecolor=:red, linewidth=2, label="I₁∠φ₁")
	jXₛI⃗₁ = (Xₛ*I₁)∠(φ₁+90)
	plot!([U⃗, U⃗-jXₛI⃗₁], arrow=:closed, linecolor=:green, linewidth=2, 
		label="XₛI₁∠(φ₁+90°)")
	plot!([0, E⃗₀₁ʼ], arrow=:closed, linecolor=:magenta, linewidth=2, label="E'₀₁∠δ₁")
	
end

# ╔═╡ 42f5ca5e-e0c8-46d2-937a-93929b833271


# ╔═╡ 1a5bf852-377d-4a42-9c31-b0fb0d4183ae
md"""
# *Notebook*
"""

# ╔═╡ 2b0b227b-e818-4b5e-a883-0dcd5419b205
begin
	if z==false
		md"""
		Documentação das bibliotecas `Julia` utilizadas: [Plots](http://docs.juliaplots.org/latest/), [PlutoUI](https://juliahub.com/docs/PlutoUI/abXFp/0.7.6/), [EasyFit.jl](https://github.com/m3g/EasyFit.jl), [Roots](https://juliamath.github.io/Roots.jl/stable/), [Dierckx](https://github.com/kbarbary/Dierckx.jl).
		"""
	else
		md"""
		`Julia` packages documentation: [Plots](http://docs.juliaplots.org/latest/), [PlutoUI](https://juliahub.com/docs/PlutoUI/abXFp/0.7.6/), [EasyFit.jl](https://github.com/m3g/EasyFit.jl), [Roots](https://juliamath.github.io/Roots.jl/stable/), [Dierckx](https://github.com/kbarbary/Dierckx.jl).
		"""
	end
end

# ╔═╡ c4a9e3a0-3471-4c7f-ab7e-87d34aea85a7
begin
	if z==false
		md"""
		!!! info
			No índice deste *notebook*, os tópicos assinalados com "💻" requerem a participação do estudante.
		"""
	else
		md"""
		!!! info
			In the table of contents of this notebook, topics marked with "💻" require student participation.
		"""
	end
end

# ╔═╡ ceb57965-22b9-48e9-85ef-47e6380a613b
if z==false
	TableOfContents(title="Índice", depth=4)
else
	TableOfContents()
end

# ╔═╡ 76e0c1bf-9b47-49df-b318-4a6c663630ea
begin
	# other stuff:
	isel_logo="https://www.isel.pt/sites/default/files/NoPath%20-%20Copy%402x_0.png"
	julia_logo="https://github.com/JuliaLang/julia-logo-graphics/blob/master/images/julia-logo-color.png?raw=true"
	version=VERSION
end;

# ╔═╡ 4c9e66bf-aec7-4e87-a0ab-f84664891742
begin
	if z==false
		md"""
		*Notebook* realizado em linguagem de programação científica `Julia`, versão $(version).

		**_Time to first plot_**: até cerca de 1.7 min.

		**Computador**: Intel® Core™ i7-7600U CPU @ 2.80GHz; 24GB RAM.
		"""
	else
		md"""
		Notebook made in `Julia` scientific programming language, version $(version).

		**Time to first plot**: up to 1.7 min.

		**Computer**: Intel® Core™ i7-7600U CPU @ 2.80GHz; 24GB RAM.
		"""
	end
end

# ╔═╡ e720fbf6-2919-4f32-a2d9-e80d8147f2cc
md"""
---
"""

# ╔═╡ 94d1f79c-efda-4391-a2e9-35e138375718
ThreeColumn(md"Text content: [![](https://i.creativecommons.org/l/by-sa/4.0/80x15.png)](http://creativecommons.org/licenses/by-sa/4.0/)", md"`Julia code`: [`MIT License`](https://www.tldrlegal.com/license/mit-license)", md" $$©$$ [`2023 Ricardo Luís`](https://ricardo-luis.github.io/lee-me2/)")

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Dierckx = "39dd38d3-220a-591b-8e3c-4c3a8c710a94"
Plots = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
PlutoTeachingTools = "661c6b06-c737-4d37-b85c-46df65de6f69"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
Roots = "f2b01f46-fcfa-551c-844a-d8ac1e96c665"

[compat]
Dierckx = "~0.5.3"
Plots = "~1.39.0"
PlutoTeachingTools = "~0.2.13"
PlutoUI = "~0.7.52"
Roots = "~2.0.19"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.9.3"
manifest_format = "2.0"
project_hash = "50a6c4b243865222159e86f7b411a2c2b3d458fd"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "91bd53c39b9cbfb5ef4b015e8b582d344532bd0a"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.2.0"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.BitFlags]]
git-tree-sha1 = "43b1a4a8f797c1cddadf60499a8a077d4af2cd2d"
uuid = "d1d4a3ce-64b1-5f1a-9ba4-7e7e69966f35"
version = "0.1.7"

[[deps.Bzip2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "19a35467a82e236ff51bc17a3a44b69ef35185a2"
uuid = "6e34b625-4abd-537c-b88f-471c36dfa7a0"
version = "1.0.8+0"

[[deps.Cairo_jll]]
deps = ["Artifacts", "Bzip2_jll", "CompilerSupportLibraries_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "JLLWrappers", "LZO_jll", "Libdl", "Pixman_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "4b859a208b2397a7a623a03449e4636bdb17bcf2"
uuid = "83423d85-b0ee-5818-9007-b63ccbeb887a"
version = "1.16.1+1"

[[deps.ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "e30f2f4e20f7f186dc36529910beaedc60cfa644"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.16.0"

[[deps.CodeTracking]]
deps = ["InteractiveUtils", "UUIDs"]
git-tree-sha1 = "a1296f0fe01a4c3f9bf0dc2934efbf4416f5db31"
uuid = "da1fd8a2-8d9e-5ec2-8556-3022fb5608a2"
version = "1.3.4"

[[deps.CodecZlib]]
deps = ["TranscodingStreams", "Zlib_jll"]
git-tree-sha1 = "02aa26a4cf76381be7f66e020a3eddeb27b0a092"
uuid = "944b1d66-785c-5afd-91f1-9de20f533193"
version = "0.7.2"

[[deps.ColorSchemes]]
deps = ["ColorTypes", "ColorVectorSpace", "Colors", "FixedPointNumbers", "PrecompileTools", "Random"]
git-tree-sha1 = "d9a8f86737b665e15a9641ecbac64deef9ce6724"
uuid = "35d6a980-a343-548e-a6ea-1d62b119f2f4"
version = "3.23.0"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

[[deps.ColorVectorSpace]]
deps = ["ColorTypes", "FixedPointNumbers", "LinearAlgebra", "Requires", "Statistics", "TensorCore"]
git-tree-sha1 = "a1f44953f2382ebb937d60dafbe2deea4bd23249"
uuid = "c3611d14-8923-5661-9e6a-0046d554d3a4"
version = "0.10.0"

    [deps.ColorVectorSpace.extensions]
    SpecialFunctionsExt = "SpecialFunctions"

    [deps.ColorVectorSpace.weakdeps]
    SpecialFunctions = "276daf66-3868-5448-9aa4-cd146d93841b"

[[deps.Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "fc08e5930ee9a4e03f84bfb5211cb54e7769758a"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.12.10"

[[deps.CommonSolve]]
git-tree-sha1 = "0eee5eb66b1cf62cd6ad1b460238e60e4b09400c"
uuid = "38540f10-b2f7-11e9-35d8-d573e4eb0ff2"
version = "0.2.4"

[[deps.Compat]]
deps = ["UUIDs"]
git-tree-sha1 = "e460f044ca8b99be31d35fe54fc33a5c33dd8ed7"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.9.0"
weakdeps = ["Dates", "LinearAlgebra"]

    [deps.Compat.extensions]
    CompatLinearAlgebraExt = "LinearAlgebra"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.5+0"

[[deps.ConcurrentUtilities]]
deps = ["Serialization", "Sockets"]
git-tree-sha1 = "5372dbbf8f0bdb8c700db5367132925c0771ef7e"
uuid = "f0e56b4a-5159-44fe-b623-3e5288b988bb"
version = "2.2.1"

[[deps.ConstructionBase]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "c53fc348ca4d40d7b371e71fd52251839080cbc9"
uuid = "187b0558-2788-49d3-abe0-74a17ed4e7c9"
version = "1.5.4"

    [deps.ConstructionBase.extensions]
    ConstructionBaseIntervalSetsExt = "IntervalSets"
    ConstructionBaseStaticArraysExt = "StaticArrays"

    [deps.ConstructionBase.weakdeps]
    IntervalSets = "8197267c-284f-5f27-9208-e0e47529a953"
    StaticArrays = "90137ffa-7385-5640-81b9-e52037218182"

[[deps.Contour]]
git-tree-sha1 = "d05d9e7b7aedff4e5b51a029dced05cfb6125781"
uuid = "d38c429a-6771-53c6-b99e-75d170b6e991"
version = "0.6.2"

[[deps.DataAPI]]
git-tree-sha1 = "8da84edb865b0b5b0100c0666a9bc9a0b71c553c"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.15.0"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "3dbd312d370723b6bb43ba9d02fc36abade4518d"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.15"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.DelimitedFiles]]
deps = ["Mmap"]
git-tree-sha1 = "9e2f36d3c96a820c678f2f1f1782582fcf685bae"
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"
version = "1.9.1"

[[deps.Dierckx]]
deps = ["Dierckx_jll"]
git-tree-sha1 = "d1ea9f433781bb6ff504f7d3cb70c4782c504a3a"
uuid = "39dd38d3-220a-591b-8e3c-4c3a8c710a94"
version = "0.5.3"

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
git-tree-sha1 = "2fb1e02f2b635d0845df5d7c167fec4dd739b00d"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.9.3"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.ExceptionUnwrapping]]
deps = ["Test"]
git-tree-sha1 = "e90caa41f5a86296e014e148ee061bd6c3edec96"
uuid = "460bff9d-24e4-43bc-9d9f-a8973cb893f4"
version = "0.1.9"

[[deps.Expat_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "4558ab818dcceaab612d1bb8c19cee87eda2b83c"
uuid = "2e619515-83b5-522b-bb60-26c02a35a201"
version = "2.5.0+0"

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
deps = ["Artifacts", "Bzip2_jll", "JLLWrappers", "Libdl", "Zlib_jll"]
git-tree-sha1 = "d8db6a5a2fe1381c1ea4ef2cab7c69c2de7f9ea0"
uuid = "d7e528f0-a631-5988-bf34-fe36492bcfd7"
version = "2.13.1+0"

[[deps.FriBidi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "aa31987c2ba8704e23c6c8ba8a4f769d5d7e4f91"
uuid = "559328eb-81f9-559d-9380-de523a88c83c"
version = "1.0.10+0"

[[deps.Future]]
deps = ["Random"]
uuid = "9fa8497b-333b-5362-9e8d-4d0656e87820"

[[deps.GLFW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libglvnd_jll", "Pkg", "Xorg_libXcursor_jll", "Xorg_libXi_jll", "Xorg_libXinerama_jll", "Xorg_libXrandr_jll"]
git-tree-sha1 = "d972031d28c8c8d9d7b41a536ad7bb0c2579caca"
uuid = "0656b61e-2033-5cc2-a64a-77c0f6c09b89"
version = "3.3.8+0"

[[deps.GR]]
deps = ["Artifacts", "Base64", "DelimitedFiles", "Downloads", "GR_jll", "HTTP", "JSON", "Libdl", "LinearAlgebra", "Pkg", "Preferences", "Printf", "Random", "Serialization", "Sockets", "TOML", "Tar", "Test", "UUIDs", "p7zip_jll"]
git-tree-sha1 = "d73afa4a2bb9de56077242d98cf763074ab9a970"
uuid = "28b8d3ca-fb5f-59d9-8090-bfdbd6d07a71"
version = "0.72.9"

[[deps.GR_jll]]
deps = ["Artifacts", "Bzip2_jll", "Cairo_jll", "FFMPEG_jll", "Fontconfig_jll", "FreeType2_jll", "GLFW_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll", "Pixman_jll", "Qt6Base_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "1596bab77f4f073a14c62424283e7ebff3072eca"
uuid = "d2c73de3-f751-5644-a686-071e5b155ba9"
version = "0.72.9+1"

[[deps.Gettext_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "9b02998aba7bf074d14de89f9d37ca24a1a0b046"
uuid = "78b55507-aeef-58d4-861c-77aaff3498b1"
version = "0.21.0+0"

[[deps.Glib_jll]]
deps = ["Artifacts", "Gettext_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Libiconv_jll", "Libmount_jll", "PCRE2_jll", "Zlib_jll"]
git-tree-sha1 = "e94c92c7bf4819685eb80186d51c43e71d4afa17"
uuid = "7746bdde-850d-59dc-9ae8-88ece973131d"
version = "2.76.5+0"

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
deps = ["Base64", "CodecZlib", "ConcurrentUtilities", "Dates", "ExceptionUnwrapping", "Logging", "LoggingExtras", "MbedTLS", "NetworkOptions", "OpenSSL", "Random", "SimpleBufferStream", "Sockets", "URIs", "UUIDs"]
git-tree-sha1 = "19e974eced1768fb46fd6020171f2cec06b1edb5"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "1.9.15"

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
git-tree-sha1 = "d75853a0bdbfb1ac815478bacd89cd27b550ace6"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.3"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.IrrationalConstants]]
git-tree-sha1 = "630b497eafcc20001bba38a4651b327dcfc491d2"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.2.2"

[[deps.JLFzf]]
deps = ["Pipe", "REPL", "Random", "fzf_jll"]
git-tree-sha1 = "f377670cda23b6b7c1c0b3893e37451c5c1a2185"
uuid = "1019f520-868f-41f5-a6de-eb00f4b6a39c"
version = "0.1.5"

[[deps.JLLWrappers]]
deps = ["Artifacts", "Preferences"]
git-tree-sha1 = "7e5d6779a1e09a36db2a7b6cff50942a0a7d0fca"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.5.0"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "31e996f0a15c7b280ba9f76636b3ff9e2ae58c9a"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.4"

[[deps.JpegTurbo_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "6f2675ef130a300a112286de91973805fcc5ffbc"
uuid = "aacddb02-875f-59d6-b918-886e6ef4fbf8"
version = "2.1.91+0"

[[deps.JuliaInterpreter]]
deps = ["CodeTracking", "InteractiveUtils", "Random", "UUIDs"]
git-tree-sha1 = "81dc6aefcbe7421bd62cb6ca0e700779330acff8"
uuid = "aa1ae85d-cabe-5617-a682-6adf51b2e16a"
version = "0.9.25"

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

[[deps.LLVMOpenMP_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "f689897ccbe049adb19a065c495e75f372ecd42b"
uuid = "1d63c593-3942-5779-bab2-d838dc0a180e"
version = "15.0.4+0"

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
git-tree-sha1 = "f428ae552340899a935973270b8d98e5a31c49fe"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.16.1"

    [deps.Latexify.extensions]
    DataFramesExt = "DataFrames"
    SymEngineExt = "SymEngine"

    [deps.Latexify.weakdeps]
    DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
    SymEngine = "123dc426-2d89-5057-bbad-38513e3affd8"

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
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "f9557a255370125b405568f9767d6d195822a175"
uuid = "94ce4f54-9a6c-5748-9c1c-f9c7231a4531"
version = "1.17.0+0"

[[deps.Libmount_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "9c30530bf0effd46e15e0fdcf2b8636e78cbbd73"
uuid = "4b2f31a3-9ecc-558c-b454-b3730dcb73e9"
version = "2.35.0+0"

[[deps.Libtiff_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "LERC_jll", "Libdl", "XZ_jll", "Zlib_jll", "Zstd_jll"]
git-tree-sha1 = "2da088d113af58221c52828a80378e16be7d037a"
uuid = "89763e89-9b03-5906-acba-b20f662cd828"
version = "4.5.1+1"

[[deps.Libuuid_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "7f3efec06033682db852f8b3bc3c1d2b0a0ab066"
uuid = "38a345b3-de98-5d2b-a5d3-14cd9215e700"
version = "2.36.0+0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.LogExpFunctions]]
deps = ["DocStringExtensions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "7d6dd4e9212aebaeed356de34ccf262a3cd415aa"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.26"

    [deps.LogExpFunctions.extensions]
    LogExpFunctionsChainRulesCoreExt = "ChainRulesCore"
    LogExpFunctionsChangesOfVariablesExt = "ChangesOfVariables"
    LogExpFunctionsInverseFunctionsExt = "InverseFunctions"

    [deps.LogExpFunctions.weakdeps]
    ChainRulesCore = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
    ChangesOfVariables = "9e997f8a-9a97-42d5-a9f1-ce6bfc15e2c0"
    InverseFunctions = "3587e190-3f89-42d0-90ee-14403ec27112"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.LoggingExtras]]
deps = ["Dates", "Logging"]
git-tree-sha1 = "0d097476b6c381ab7906460ef1ef1638fbce1d91"
uuid = "e6f89c97-d47a-5376-807f-9c37f3926c36"
version = "1.0.2"

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
git-tree-sha1 = "9ee1618cbf5240e6d4e0371d6f24065083f60c48"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.11"

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
version = "2.28.2+0"

[[deps.Measures]]
git-tree-sha1 = "c13304c81eec1ed3af7fc20e75fb6b26092a1102"
uuid = "442fdcdd-2543-5da2-b0f3-8c86c306513e"
version = "0.3.2"

[[deps.Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "f66bdc5de519e8f8ae43bdc598782d35a25b1272"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.1.0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.10.11"

[[deps.NaNMath]]
deps = ["OpenLibm_jll"]
git-tree-sha1 = "0877504529a3e5c3343c6f8b4c0381e57e4387e4"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "1.0.2"

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
version = "0.3.21+4"

[[deps.OpenLibm_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "05823500-19ac-5b8b-9628-191a04bc5112"
version = "0.8.1+0"

[[deps.OpenSSL]]
deps = ["BitFlags", "Dates", "MozillaCACerts_jll", "OpenSSL_jll", "Sockets"]
git-tree-sha1 = "51901a49222b09e3743c65b8847687ae5fc78eb2"
uuid = "4d8831e6-92b7-49fb-bdf8-b643e874388c"
version = "1.4.1"

[[deps.OpenSSL_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "bbb5c2115d63c2f1451cb70e5ef75e8fe4707019"
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "1.1.22+0"

[[deps.Opus_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "51a08fb14ec28da2ec7a927c4337e4332c2a4720"
uuid = "91d4177d-7536-5919-b921-800302f37372"
version = "1.3.2+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "2e73fe17cac3c62ad1aebe70d44c963c3cfdc3e3"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.6.2"

[[deps.PCRE2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "efcefdf7-47ab-520b-bdef-62a2eaa19f15"
version = "10.42.0+0"

[[deps.Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "716e24b21538abc91f6205fd1d8363f39b442851"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.7.2"

[[deps.Pipe]]
git-tree-sha1 = "6842804e7867b115ca9de748a0cf6b364523c16d"
uuid = "b98c9c47-44ae-5843-9183-064241ee97a0"
version = "1.3.0"

[[deps.Pixman_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "LLVMOpenMP_jll", "Libdl"]
git-tree-sha1 = "64779bc4c9784fee475689a1752ef4d5747c5e87"
uuid = "30392449-352a-5448-841d-b1acce4e97dc"
version = "0.42.2+0"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.9.2"

[[deps.PlotThemes]]
deps = ["PlotUtils", "Statistics"]
git-tree-sha1 = "1f03a2d339f42dca4a4da149c7e15e9b896ad899"
uuid = "ccf2f8ad-2431-5c83-bf29-c5338b663b6a"
version = "3.1.0"

[[deps.PlotUtils]]
deps = ["ColorSchemes", "Colors", "Dates", "PrecompileTools", "Printf", "Random", "Reexport", "Statistics"]
git-tree-sha1 = "f92e1315dadf8c46561fb9396e525f7200cdc227"
uuid = "995b91a9-d308-5afd-9ec6-746e21dbc043"
version = "1.3.5"

[[deps.Plots]]
deps = ["Base64", "Contour", "Dates", "Downloads", "FFMPEG", "FixedPointNumbers", "GR", "JLFzf", "JSON", "LaTeXStrings", "Latexify", "LinearAlgebra", "Measures", "NaNMath", "Pkg", "PlotThemes", "PlotUtils", "PrecompileTools", "Preferences", "Printf", "REPL", "Random", "RecipesBase", "RecipesPipeline", "Reexport", "RelocatableFolders", "Requires", "Scratch", "Showoff", "SparseArrays", "Statistics", "StatsBase", "UUIDs", "UnicodeFun", "UnitfulLatexify", "Unzip"]
git-tree-sha1 = "ccee59c6e48e6f2edf8a5b64dc817b6729f99eb5"
uuid = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
version = "1.39.0"

    [deps.Plots.extensions]
    FileIOExt = "FileIO"
    GeometryBasicsExt = "GeometryBasics"
    IJuliaExt = "IJulia"
    ImageInTerminalExt = "ImageInTerminal"
    UnitfulExt = "Unitful"

    [deps.Plots.weakdeps]
    FileIO = "5789e2e9-d7fb-5bc7-8068-2c6fae9b9549"
    GeometryBasics = "5c1252a2-5f33-56bf-86c9-59e7332b4326"
    IJulia = "7073ff75-c697-5162-941a-fcdaad2a7d2a"
    ImageInTerminal = "d8c32880-2388-543b-8c61-d9f865259254"
    Unitful = "1986cc42-f94f-5a68-af5c-568840ba703d"

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
git-tree-sha1 = "542de5acb35585afcf202a6d3361b430bc1c3fbd"
uuid = "661c6b06-c737-4d37-b85c-46df65de6f69"
version = "0.2.13"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "e47cd150dbe0443c3a3651bc5b9cbd5576ab75b7"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.52"

[[deps.PrecompileTools]]
deps = ["Preferences"]
git-tree-sha1 = "03b4c25b43cb84cee5c90aa9b5ea0a78fd848d2f"
uuid = "aea7be01-6a6a-4083-8856-8a6e6704d82a"
version = "1.2.0"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "7eb1686b4f04b82f96ed7a4ea5890a4f0c7a09f1"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.4.0"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.Qt6Base_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Fontconfig_jll", "Glib_jll", "JLLWrappers", "Libdl", "Libglvnd_jll", "OpenSSL_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Xorg_libxcb_jll", "Xorg_xcb_util_image_jll", "Xorg_xcb_util_keysyms_jll", "Xorg_xcb_util_renderutil_jll", "Xorg_xcb_util_wm_jll", "Zlib_jll", "xkbcommon_jll"]
git-tree-sha1 = "364898e8f13f7eaaceec55fd3d08680498c0aa6e"
uuid = "c0090381-4147-56d7-9ebc-da0b1113ec56"
version = "6.4.2+3"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.RecipesBase]]
deps = ["PrecompileTools"]
git-tree-sha1 = "5c3d09cc4f31f5fc6af001c250bf1278733100ff"
uuid = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
version = "1.3.4"

[[deps.RecipesPipeline]]
deps = ["Dates", "NaNMath", "PlotUtils", "PrecompileTools", "RecipesBase"]
git-tree-sha1 = "45cf9fd0ca5839d06ef333c8201714e888486342"
uuid = "01d81517-befc-4cb6-b9ec-a95719d0359c"
version = "0.6.12"

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
git-tree-sha1 = "1e597b93700fa4045d7189afa7c004e0584ea548"
uuid = "295af30f-e4ad-537b-8983-00126c2a3abe"
version = "3.5.3"

[[deps.Roots]]
deps = ["ChainRulesCore", "CommonSolve", "Printf", "Setfield"]
git-tree-sha1 = "ff42754a57bb0d6dcfe302fd0d4272853190421f"
uuid = "f2b01f46-fcfa-551c-844a-d8ac1e96c665"
version = "2.0.19"

    [deps.Roots.extensions]
    RootsForwardDiffExt = "ForwardDiff"
    RootsIntervalRootFindingExt = "IntervalRootFinding"
    RootsSymPyExt = "SymPy"

    [deps.Roots.weakdeps]
    ForwardDiff = "f6369f11-7733-5829-9624-2563aa707210"
    IntervalRootFinding = "d2bf35a9-74e0-55ec-b149-d360ff49b807"
    SymPy = "24249f21-da20-56a4-8eb1-6a02cf4ae2e6"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Scratch]]
deps = ["Dates"]
git-tree-sha1 = "30449ee12237627992a99d5e30ae63e4d78cd24a"
uuid = "6c6a2e73-6563-6170-7368-637461726353"
version = "1.2.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.Setfield]]
deps = ["ConstructionBase", "Future", "MacroTools", "StaticArraysCore"]
git-tree-sha1 = "e2cc6d8c88613c05e1defb55170bf5ff211fbeac"
uuid = "efcf1570-3423-57d1-acb7-fd33fddbac46"
version = "1.1.1"

[[deps.Showoff]]
deps = ["Dates", "Grisu"]
git-tree-sha1 = "91eddf657aca81df9ae6ceb20b959ae5653ad1de"
uuid = "992d4aef-0814-514b-bc4d-f2e9a6c4116f"
version = "1.0.3"

[[deps.SimpleBufferStream]]
git-tree-sha1 = "874e8867b33a00e784c8a7e4b60afe9e037b74e1"
uuid = "777ac1f9-54b0-4bf8-805c-2214025038e7"
version = "1.1.0"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "c60ec5c62180f27efea3ba2908480f8055e17cee"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.1.1"

[[deps.SparseArrays]]
deps = ["Libdl", "LinearAlgebra", "Random", "Serialization", "SuiteSparse_jll"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.StaticArraysCore]]
git-tree-sha1 = "36b3d696ce6366023a0ea192b4cd442268995a0d"
uuid = "1e83bf80-4336-4d27-bf5d-d5a4f845583c"
version = "1.4.2"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.9.0"

[[deps.StatsAPI]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "1ff449ad350c9c4cbc756624d6f8a8c3ef56d3ed"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.7.0"

[[deps.StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "LogExpFunctions", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "75ebe04c5bed70b91614d684259b661c9e6274a4"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.34.0"

[[deps.SuiteSparse_jll]]
deps = ["Artifacts", "Libdl", "Pkg", "libblastrampoline_jll"]
uuid = "bea87d4a-7f5b-5778-9afe-8cc45184846c"
version = "5.10.1+6"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

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
git-tree-sha1 = "9a6ae7ed916312b41236fcef7e0af564ef934769"
uuid = "3bb67fe8-82b1-5028-8e26-92a6c54297fa"
version = "0.9.13"

[[deps.Tricks]]
git-tree-sha1 = "aadb748be58b492045b4f56166b5188aa63ce549"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.7"

[[deps.URIs]]
git-tree-sha1 = "b7a5e99f24892b6824a954199a45e9ffcc1c70f0"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.5.0"

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

[[deps.Unitful]]
deps = ["Dates", "LinearAlgebra", "Random"]
git-tree-sha1 = "a72d22c7e13fe2de562feda8645aa134712a87ee"
uuid = "1986cc42-f94f-5a68-af5c-568840ba703d"
version = "1.17.0"

    [deps.Unitful.extensions]
    ConstructionBaseUnitfulExt = "ConstructionBase"
    InverseFunctionsUnitfulExt = "InverseFunctions"

    [deps.Unitful.weakdeps]
    ConstructionBase = "187b0558-2788-49d3-abe0-74a17ed4e7c9"
    InverseFunctions = "3587e190-3f89-42d0-90ee-14403ec27112"

[[deps.UnitfulLatexify]]
deps = ["LaTeXStrings", "Latexify", "Unitful"]
git-tree-sha1 = "e2d817cc500e960fdbafcf988ac8436ba3208bfd"
uuid = "45397f5d-5981-4c77-b2b3-fc36d6e9b728"
version = "1.6.3"

[[deps.Unzip]]
git-tree-sha1 = "ca0969166a028236229f63514992fc073799bb78"
uuid = "41fe7b60-77ed-43a1-b4f0-825fd5a5650d"
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

[[deps.XML2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libiconv_jll", "Zlib_jll"]
git-tree-sha1 = "04a51d15436a572301b5abbb9d099713327e9fc4"
uuid = "02c8fc9c-b97f-50b9-bbe4-9be30ff0a78a"
version = "2.10.4+0"

[[deps.XSLT_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgcrypt_jll", "Libgpg_error_jll", "Libiconv_jll", "Pkg", "XML2_jll", "Zlib_jll"]
git-tree-sha1 = "91844873c4085240b95e795f692c4cec4d805f8a"
uuid = "aed1982a-8fda-507f-9586-7b0439959a61"
version = "1.1.34+0"

[[deps.XZ_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "cf2c7de82431ca6f39250d2fc4aacd0daa1675c0"
uuid = "ffd25f8a-64ca-5728-b0f7-c24cf3aae800"
version = "5.4.4+0"

[[deps.Xorg_libX11_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libxcb_jll", "Xorg_xtrans_jll"]
git-tree-sha1 = "afead5aba5aa507ad5a3bf01f58f82c8d1403495"
uuid = "4f6342f7-b3d2-589e-9d20-edeb45f2b2bc"
version = "1.8.6+0"

[[deps.Xorg_libXau_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "6035850dcc70518ca32f012e46015b9beeda49d8"
uuid = "0c0b7dd1-d40b-584c-a123-a41640f87eec"
version = "1.0.11+0"

[[deps.Xorg_libXcursor_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXfixes_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "12e0eb3bc634fa2080c1c37fccf56f7c22989afd"
uuid = "935fb764-8cf2-53bf-bb30-45bb1f8bf724"
version = "1.2.0+4"

[[deps.Xorg_libXdmcp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "34d526d318358a859d7de23da945578e8e8727b7"
uuid = "a3789734-cfe1-5b06-b2d0-1dd0d9d62d05"
version = "1.1.4+0"

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
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "8fdda4c692503d44d04a0603d9ac0982054635f9"
uuid = "14d82f49-176c-5ed1-bb49-ad3f5cbd8c74"
version = "0.1.1+0"

[[deps.Xorg_libxcb_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "XSLT_jll", "Xorg_libXau_jll", "Xorg_libXdmcp_jll", "Xorg_libpthread_stubs_jll"]
git-tree-sha1 = "b4bfde5d5b652e22b9c790ad00af08b6d042b97d"
uuid = "c7cfdc94-dc32-55de-ac96-5a1b8d977c5b"
version = "1.15.0+0"

[[deps.Xorg_libxkbfile_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libX11_jll"]
git-tree-sha1 = "730eeca102434283c50ccf7d1ecdadf521a765a4"
uuid = "cc61e674-0454-545c-8b26-ed2c68acab7a"
version = "1.1.2+0"

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
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libxkbfile_jll"]
git-tree-sha1 = "330f955bc41bb8f5270a369c473fc4a5a4e4d3cb"
uuid = "35661453-b289-5fab-8a00-3d9160c6a3a4"
version = "1.4.6+0"

[[deps.Xorg_xkeyboard_config_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_xkbcomp_jll"]
git-tree-sha1 = "691634e5453ad362044e2ad653e79f3ee3bb98c3"
uuid = "33bec58e-1273-512f-9401-5d533626f822"
version = "2.39.0+0"

[[deps.Xorg_xtrans_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "e92a1a012a10506618f10b7047e478403a046c77"
uuid = "c5fb5394-a638-5e4d-96e5-b29de1b5cf10"
version = "1.5.0+0"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.13+0"

[[deps.Zstd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "49ce682769cd5de6c72dcf1b94ed7790cd08974c"
uuid = "3161d3a3-bdf6-5164-811a-617609db77b4"
version = "1.5.5+0"

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
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.8.0+0"

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
# ╟─a90a4742-8d11-466d-8caa-218d90ada25c
# ╟─40083415-01b1-4570-bd6a-2c25e4cf4673
# ╟─edd5b03d-f897-4af6-8def-7bd29abaee83
# ╟─263cc10b-55d4-47bd-8a6c-dcdacc4cdf3d
# ╟─0262a34b-95f8-453e-812c-43663d6337b2
# ╟─5a58ddf6-b17e-4c34-bae5-2aa60245a9c3
# ╟─47a00c38-b9d7-4515-8b4b-3bca0d107e6c
# ╟─236fc3f7-321e-44f7-8ab7-18098ff1b22b
# ╟─9b6e6867-c94e-4e8e-8743-82e51f320901
# ╠═1a6abf20-e5d3-436a-bdc2-f99110ce4956
# ╠═0084d746-bb78-4575-8ae7-4fbc8e072810
# ╠═d968ea56-b785-4ec4-a3fe-51b8cf46bb0f
# ╟─cbffc42a-b2d9-4f0a-b0e6-32869e629de4
# ╟─a4aa3362-ce8c-48ba-a840-9e6e8f8718a3
# ╟─6b429d28-58a9-49d9-b0d4-e48927edb3de
# ╟─1dca324c-2a26-4da8-9e17-f10bc01a7300
# ╟─53284387-5f8b-4838-ba77-2c69c58c73eb
# ╟─c5904d62-a2ab-4298-bcb2-a398c89ef77c
# ╠═bd4783a6-936c-4700-bbf8-74b632eb8328
# ╠═b6813c43-a2b4-42f7-85c3-111f6ff48767
# ╟─3bdecd8a-708d-4bbf-811a-4f96e2f011b9
# ╟─039f5f54-872d-41ba-85a4-5c134a1a0c1b
# ╟─266ad8ad-9fca-415f-b8e6-026c4f481364
# ╟─f6d5a921-021e-4ff4-9d75-6e6add431efb
# ╟─b00d70d1-a7fd-4c7f-90fe-a8722ad50b31
# ╟─26e6b2e7-ec1e-456e-848e-57af1f0a27dd
# ╠═ff8ce092-49a1-4165-b621-246ad4335c81
# ╠═4e19252c-ab26-404f-b0da-4449fd0450b7
# ╠═e9074cf1-9a24-451e-aa64-cd948b15f9b6
# ╠═052e8a6e-dd54-4079-b112-6b5275cfd6bb
# ╠═d4defde1-3d5f-4473-b9f6-24322d92fdd8
# ╠═c0c59b61-943e-4ed0-935c-ec5cdf665b0d
# ╠═b44937d1-b83a-417b-a153-679d388adb59
# ╟─253bfa2d-233a-4320-b8df-bdffd5501c43
# ╟─48c57f54-1cb3-43af-a853-f778d5f37ad8
# ╟─06f9ce73-97b1-4323-8960-e8616d1f8af1
# ╟─0c8e08b0-2a1f-43f1-9bfa-a4a31d255ade
# ╟─9b1449bf-64d5-482c-9504-96a1638c8f62
# ╟─d21bcd53-f213-46cc-8e11-cfa336bf98aa
# ╟─a99ee5e5-334f-4125-9032-f14b070373cc
# ╟─12fb6b85-6e04-4dbc-bb04-6ff10e2da2f5
# ╟─c71d7953-dc87-4f39-bc50-e76a63a53fcf
# ╟─f1cdf6dd-e704-4eec-8a01-92ee3965d626
# ╟─75e477a5-e856-4ad6-a659-ac02e58ecf8a
# ╟─e993f8a1-5662-4f3b-b51b-8e0ef1fec76d
# ╟─5bf619b1-8756-4efd-9104-ea7bf7bcd079
# ╟─71e8be35-232f-4772-aca7-defe3cac3cd0
# ╟─14389231-1876-4015-8f1d-d7f5fa41a04c
# ╟─f164a7e0-2923-4154-802d-8128f5b06450
# ╟─72c821fe-33e9-46a9-8414-076f14b7ab3f
# ╟─974731dd-ca12-42b8-9f82-9d1337cf319c
# ╟─b13cc67a-5ff9-4918-8b8e-13fb3b0e452e
# ╟─4eac8988-f5c8-44d5-8fad-2b127d55bc3c
# ╟─dc9f5db7-38dc-4d41-a9de-b29b2ab6fb0f
# ╟─9c25ef0d-bfd4-4957-80a3-ff6a6fe9f858
# ╟─849a11aa-b172-428c-8b9a-a49879d70f80
# ╟─a3a183a1-383d-446f-9ed4-c2925398061b
# ╠═69d15fb8-85f8-4bec-a647-dc07afc8ba3c
# ╟─cddb2d07-a783-4897-a7dd-1e81cdd86df0
# ╠═661f99ef-de1c-4b53-a26d-e07e92badc52
# ╠═a752ef6e-b021-437c-9942-fa44887ee3d9
# ╠═f083fcc7-d4d6-49ba-a6cf-27417a9d2a32
# ╠═ff6964bd-9f21-42c2-8f15-c6b30330c169
# ╟─57c7d7f0-0b06-4f3f-8403-e8867b6f4fc4
# ╠═3398ead4-b619-4215-a05c-b68399c20c53
# ╠═1197f2e8-161b-4416-a8e8-621f7ebe3d6b
# ╠═1e113a09-77c3-44f2-af30-72a587396cb7
# ╠═de8110e6-3caf-4169-9af9-55783689bc8c
# ╠═2b7d5e66-78cb-43dc-884f-1df1a745764f
# ╠═075c639a-57cc-4bde-8079-9a61efad740d
# ╟─5ce13622-87c3-40ed-97a2-58591f6f9514
# ╟─55b1dd0d-8a3c-45b5-8681-7388fdcc7de5
# ╟─76db2f36-7b1c-4472-a3e6-ca1c4520b28e
# ╟─21ab727a-d417-4728-9ceb-706789fc37b9
# ╟─882151a2-8110-4829-9b4b-f6a47e9aa6be
# ╟─b8492061-7322-4af8-a885-1dbbb36f2f36
# ╟─52f3510a-0d30-4794-8ea7-c9dce2a214e0
# ╟─aac2ef1d-67b8-4cee-a5ec-b0fb6c257455
# ╟─5f5d43aa-766d-4bb8-bcf9-4cb76b34c6bc
# ╠═0f0a91cc-922e-4788-857c-156859f63f0e
# ╟─a21fe332-d5f1-4fff-90ab-95380fa29ae4
# ╟─693a2aae-fc42-43d5-8745-2b397892a7a0
# ╠═fe7a2fe7-40f5-412c-83f9-1e7084809cb0
# ╠═fd7ecd4b-a8f8-4809-9f36-505494221a70
# ╠═8592168c-5e8d-43d4-8c33-b73c836223a7
# ╟─fbb03be0-96c7-4114-9b7e-80fef92bd804
# ╟─8b14d6b5-6aac-4507-8ae8-1b2823b314fd
# ╟─a25f59a4-d20b-49d6-ac6f-53899279f9a7
# ╟─336eef9b-b608-43d7-b36f-d282371fecea
# ╠═32016778-0b66-4a0c-82f8-1c1f0e562d8b
# ╠═377458d9-a00e-45af-9f4b-d8961bca5f89
# ╠═084f8cb6-dba4-452f-86cb-7a19117185ff
# ╠═8ff2dca1-b7fc-4597-8fb3-30d6d848c8f3
# ╟─bd899d78-df7b-4770-b43a-965ab1ac11e0
# ╟─7b68f211-36b3-4577-9d9e-763b14ef95d7
# ╟─8ece1d58-d4aa-441f-ae69-d25685670472
# ╟─3718458e-0f67-42cd-a27d-317ee0906145
# ╟─82941af9-9cf9-4b92-b308-ad1db029fa72
# ╟─1dca9b65-07bf-4c52-b691-65ae0147887c
# ╟─d81ab12b-6339-477c-b69c-0981ca04d1d2
# ╟─fd41f976-4b92-4009-b353-9db4161b6223
# ╟─8330caa4-d7b9-476b-92d9-38f0b64af425
# ╠═706c07f0-eebb-4f71-8a4d-3093b1c79af9
# ╟─714edc82-b6f7-4b88-b345-c9578f83ff30
# ╠═a19492ac-cc05-4f3b-9789-4f6cee8d9439
# ╟─bfd3608d-6aa2-4891-be71-cd809ce71dc6
# ╠═8bf55f99-3cfb-4ffc-95d2-367fb213f3a5
# ╟─e178a306-05a2-4fcb-8101-db1d4fd11cf4
# ╟─04c34d5b-7cb9-418a-84a5-6ec900cefa58
# ╟─d6c33c3b-3823-4091-a397-5b78212d33d4
# ╟─53087350-c94f-41e3-a0e3-9ad6a54f1d7e
# ╠═0ca024ef-9fe9-41e6-a87e-feaddc80191f
# ╠═aecd1555-ed11-4ab0-ad3d-98ada78f45a7
# ╟─42f5ca5e-e0c8-46d2-937a-93929b833271
# ╟─1a5bf852-377d-4a42-9c31-b0fb0d4183ae
# ╟─2b0b227b-e818-4b5e-a883-0dcd5419b205
# ╠═b88eb231-8e1b-4211-bb68-9f3b2b78fb10
# ╟─4c9e66bf-aec7-4e87-a0ab-f84664891742
# ╟─c4a9e3a0-3471-4c7f-ab7e-87d34aea85a7
# ╠═ceb57965-22b9-48e9-85ef-47e6380a613b
# ╟─76e0c1bf-9b47-49df-b318-4a6c663630ea
# ╟─e720fbf6-2919-4f32-a2d9-e80d8147f2cc
# ╟─94d1f79c-efda-4391-a2e9-35e138375718
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
