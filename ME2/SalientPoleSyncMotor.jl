### A Pluto.jl notebook ###
# v0.19.12

#> [frontmatter]
#> URL = "https://github.com/Ricardo-Luis/notebooks/blob/main/ME2/SalientPoleSyncMotor.jl"
#> title = "Motor síncrono de polos salientes"
#> "to cite the work, use" = "Ricardo Luís. (2022). Documentos computacionais sobre Máquinas Elétricas II [coleção de notebooks de suporte a Máquinas Elétricas II, lecionada no curso LEE do ISEL]. Disponível: https://ricardo-luis.github.io/me2"
#> date = "2022-10-24"
#> description = "Resolução do exercício 8"
#> tags = ["Salient pole synchronous motor"]

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

# ╔═╡ cce68c02-32d9-4d2b-bd1a-224aa9c07e1e
begin
	using PlutoUI, PlutoTeachingTools # interface, ferramentas de edição
	using Plots   						# gráficos 
end

# ╔═╡ 9b84722c-af8f-4c83-98b6-d1fb41da86ad
ThreeColumn(md"`SalientPoleSyncMotor.jl`", md"[![](https://img.shields.io/badge/GitHub_URL-notebook-C09107)](https://github.com/Ricardo-Luis/notebooks/blob/main/ME2/SalientPoleSyncMotor.jl)", md"`Last update: 24·10·2022`")

# ╔═╡ b3fd50c7-7840-44a5-a640-2689adde4589
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

# ╔═╡ 03d786ee-301e-48fb-a213-b24da7b74199
md"""
---
$\textbf{MÁQUINAS ELÉTRICAS SÍNCRONAS TRIFÁSICAS}$

$\text{EXERCÍCIO 8}$ 

$\textbf{Motor síncrono de polos salientes}$
---
"""

# ╔═╡ 589625e8-9b8e-4358-9186-66def36f9adc
md"""
# Dados:
"""

# ╔═╡ 17bc7f80-c13c-11eb-227f-b125d84c8b40
md"""
**Uma máquina síncrona 3~ de pólos salientes, 50MVA, 11kV, 60Hz, enrolamentos do
estator em Y, apresenta as reatâncias: $$X_d=0.8\mathrm pu$$ e $$X_q=0.4\mathrm pu$$. 
Como motor síncrono é colocado à plena carga com fator de potência 0,8 indutivo. 
As perdas mecânicas representam são 0,15pu.  
Despreze as perdas na resistência do induzido.**
"""

# ╔═╡ 20ed504e-08d1-45b9-8494-c42170182898
(Sₙ, Uₙ, f, Xd, Xq, cosφₙ, pᵣₒₜ) = (50e6, 11e3, 60, 0.8, 0.4, 0.8, 0.15)

# ╔═╡ 14ae0471-3eaf-4e46-ad4a-79a7c2ef3632


# ╔═╡ 25f9aa0c-efa0-4c8a-bbfb-c5648bf2f8a2
md"""
# a) Determine $$X_d$$ e $$X_q$$ em Ω;
"""

# ╔═╡ 0545e797-9d40-48c4-ab96-195959331560
md"""
A utilização de *valores por unidade*, $$\mathrm {pu}$$,  apresenta diversas vantagens:
 - permite uma melhor comparação relativa entre máquinas de diferentes potências;
 - torna as grandezas adimensionais, facilitando a observação das mesmas face aos valores nominais de funcionamento;
 - simplifica a utilização do fator $$\sqrt3$$ em sistemas trifásicos.

Definindo a potência de base, $$S_b$$, e a tensão de base, $$U_b$$:

$$S_b=S_n\quad;\quad U_b=U_n$$

como: $$\quad S_b=U_bI_b\quad \Leftrightarrow \quad S_b=\frac{U_b^2}{Z_b}\quad \Rightarrow\quad Z_b=\frac{U_b^2}{S_b}$$

sendo $$Z_b$$ a impedância de base. Assim:

$$\begin{cases}X_d(\Omega) = X_d(\mathrm{pu}).Z_b\\X_q(\Omega) = X_q(\mathrm{pu}).Z_b \end{cases}$$
"""

# ╔═╡ 342aacbe-df8e-42b9-a7a2-8538476f2a80
begin
	Sb = Sₙ
	Ub = Uₙ
	Zb = Ub^2/Sb
	Xd_Ω = Xd*Zb
	Xq_Ω = Xq*Zb
	Xd_Ω, Xq_Ω
end

# ╔═╡ 8a9d2209-ed57-402f-a649-841dcf23b127


# ╔═╡ 65dd0a07-ff99-4887-8a86-142248705131
md"""
# b) Determine a FCEM em pu;
"""

# ╔═╡ 8b677658-96a8-40cb-b4cf-1638703dda22
md"""
A força contra-eletromotriz (FCEM) de vazio do motor síncrono de polos salientes, $$E'_0$$, vem dada pela equação vetorial:

$$\overline{E'}_0=\overline{U}-(R+jX_q)\overline{I}-j(X_d-X_q)\overline{I}_d$$

com: $$\quad\overline{E'}=\overline{U}-(R+jX_q)\overline{I}$$

A determinação do vetor FCEM efetiva, $$\overline{E'}$$, (cálculo intermédio de $$\overline{E'}_0$$) permite definir a posição espacial dos eixos direto (linha dos pólos) e de quadratura (posicão das FCEM), uma vez que se obtém o ângulo de carga, $$\delta$$.
"""

# ╔═╡ 3ec74057-fcbb-4d79-8aca-719289c2299e
md"""
O cálculo de $$\overline I_d$$ é obtido a partir da relação trigonométrica com o vetor da corrente, $$\overline I$$, observado o diagrama vetorial de tensões:

Assim, no caso concreto:  

$$\overline I_d=I\sin(|\varphi|-|\delta|)\angle (\delta-90°)$$
"""

# ╔═╡ 49053499-f759-4043-a9b8-48f42e45589a
md"""
## Diagrama vetorial de tensões do motor síncrono de polos salientes
"""

# ╔═╡ de577063-d31a-407c-b706-870fb9bfdc58


# ╔═╡ 19c628e8-60c9-46d0-9ab8-78e70b8bfa6f
md"""
# c) $$P_d^{fcem}(pu)$$; $$P_d^{rel}(pu)$$

**Determine a potências desenvolvidas (em pu) devido à FCEM de excitação e devido ao
efeito de relutância do rotor;**
"""

# ╔═╡ 2cd26842-6c40-4dc0-9979-da4685630aa1
md"""
As parcelas da potência desenvolvida em *valores por unidade* são determinadas pelas expressões:

$$P_d^{fcem}(pu)=\frac{UE'_0}{X_d}\sin \delta$$
$$P_d^{rel}(pu)=\frac{U^2(X_d-Xq)}{2X_dX_q}\sin(2\delta)$$

O que resulta:
"""

# ╔═╡ 70fd32b5-44a9-425b-9c87-62bdee2d6dc0


# ╔═╡ 6bc18d01-7285-4b7b-9769-3a7d52baae75
md"""
# d) Limite de estabilidade
**Se a corrente de excitação for reduzida a zero, a máquina continua em sincronismo?
Justifique;**
"""

# ╔═╡ 60f80e79-eeb8-4b60-801f-98caa28b4dfd
md"""
Por conseguinte, como: $$|P_d^{rel}(max)|< |P_d|$$, conclui-se que o motor perderia o sincronismo nesta situação $$(\space I_{exc}=0\space\mathrm {pu})$$, passando a um funcionamento instável.
"""

# ╔═╡ 9432cc05-5632-4e58-bf15-000783ee628c


# ╔═╡ dd7d16e4-7b01-4aa0-a1ba-ecc7881900fb
md"""
# e) Funcionamento em vazio, sem $$I_{exc}$$

**e) Se a carga ao veio for retirada e a corrente de excitação reduzida a zero, determine o valor da corrente do estator (em pu) e o fator de potência. Desenhe o diagrama vetorial da máquina para esta situação.**
"""

# ╔═╡ 61609aa9-9feb-4a63-b4e9-2fd9a88f8106
md"""
Sem carga ao veio, $$\quad P_u=0\mathrm W\quad \Rightarrow \quad P_d=p_{rot}=0.15\mathrm{pu}$$.

Por outro lado, $$\quad I_{exc}=0\mathrm A\quad \Rightarrow \quad E'_0\simeq 0\mathrm V \quad \Rightarrow \quad P_d^{fcem}\simeq 0\mathrm W$$.

Por conseguinte, $$\quad P_d^{rel}=p_{rot}=0.15\mathrm{pu}\quad$$ com $$\quad P_d^{rel}$$:

$$P_d^{rel}(pu)=\frac{U^2(X_d-X_q)}{2X_dX_q}\sin(2\delta_0)$$
"""

# ╔═╡ 28da7f3c-97fd-4a80-ad21-eeb201dcc881
md"""
Do diagrama vetorial de tensões deste motor síncrono, retiram-se as seguintes relações para as componentes da corrente, $$I$$, nos eixos direto e de quadratura, em função do ângulo de carga, δ:

$$\begin{cases}I_q=\frac{U}{X_q}\sin(|\delta|) \\I_d=\frac{U}{X_d}\cos(\delta)-\frac{E'_0}{X_d}\end{cases}$$

Vetorialmente as componentes da corrente nos eixos direto e de quadratura ficam representadas por:

$$\begin{cases}\overline I_q=I_q\angle \delta\\ \overline I_d= I_d\angle (\delta-90°)\end{cases}$$

Assim, o vetor de corrente, $$\overline I$$ é obtido por:

$$\overline I=\overline I_d+\overline I_q$$
"""

# ╔═╡ 311eecf2-4bd6-44bc-8c67-a680f4fd5d33
md"""
## Diagrama vetorial de tensões 💻
"""

# ╔═╡ b47b956c-8880-4c22-aeea-d9a55c518b6a
md"""
Para se perceber o efeito das reduções da carga ao veio e da corrente de excitação, criou-se um segundo diagrama vetorial de tensões/correntes, mas dependente da posição de 2 cursores (*sliders*) associados à variação de cada um dos parâmetros $$(\delta$$ e $$I_{exc})$$, permitindo observar os seus efeitos sucessivos, no desenho do diagrama vetorial:
"""

# ╔═╡ 78a2ef93-5ed1-44f8-8aa9-7e7d8d80a2df
md"""
Repare-se para qualquer valor do ângulo de carga, $$\delta$$, quando a corrente de excitação se torna nula, a FCEM de vazio, $$\overline {E'}_0$$, torna-se também nula e o diagrama vetorial de tensões pode ser representado apenas pelo triângulo retângulo formado pelos vetores: $$\quad\overline U$$, $$\space\space-jX_q\overline I_q\quad$$ e $$\quad-jX_d\overline I_d$$. 

Ou seja: $$\quad\overline {E'}_0=\overline U -jX_q\overline I_q -jX_d\overline I_d\quad$$ com $$\quad\overline {E'}_0=0 \space\mathrm{pu}$$.
"""

# ╔═╡ c5cc14a5-73c6-4f10-bc3e-bd7b68eddafa
md"""
!!! nota
	Os resultados da **alínea e)** são corretamente apresentados apenas quandos os cursores se encontrem nas posições:
	
	$$\delta=\delta_0 \quad \mathrm e \quad I_{exc}=0 \space\mathrm {pu}$$
"""

# ╔═╡ 5f84cb7b-9779-41d7-87b1-ecd357033c04


# ╔═╡ 8603f697-58ec-4c77-8749-4487f2053aff
md"""
# Notação complexa
"""

# ╔═╡ dc95260b-8190-407b-9981-dff1e84acd62
begin
	∠(x) = cis(deg2rad(x)) 		# forma polar
	j = Base.im 				# forma retangular
end;

# ╔═╡ d5d4554e-428a-457a-8fdb-47dc977f9d01
begin
	φₙ = -acos(cosφₙ)
	φₙ = rad2deg(φₙ)
	I = 1 					# 1pu
	U = 1 					# 1pu
	I⃗ = (I)∠(φₙ)			# vetor da corrente em pu
	U⃗ = (U)∠(0)				# vetor da tensão em pu
	
	# Cálculo de E⃗ʼ:
	E⃗ʼ = U⃗-j*Xq*I⃗
	Eʼ = abs(E⃗ʼ)
	Eʼ = round(Eʼ, digits=3)
	δ = angle(E⃗ʼ)
	δ = rad2deg(δ)
	δ = round(δ, digits=2)
	Eʼ, δ
end;

# ╔═╡ 4dd894c8-9b9b-474d-9a98-d805328b609e
md"""
Assim, obtém-se $$\overline{E'}=$$ $Eʼ ∠ $δ ° $$\space\mathrm {pu}$$.
"""

# ╔═╡ 45b5c9d8-93ce-4b64-8c81-431dcbc6531f
begin
	Pdʳᵉˡmax = -U^2*(Xd-Xq)/(2*Xd*Xq)
	Pdʳᵉˡmax = round(Pdʳᵉˡmax, digits=2)
end;

# ╔═╡ 892b1d19-c88a-4add-ac18-70e799e01092
begin
	δ₀ = -0.5*asin(pᵣₒₜ*2*Xd*Xq/(U^2*(Xd-Xq)))
	δ₀ = rad2deg(δ₀)
	δ₀ = round(δ₀, digits=2)
end;

# ╔═╡ 33d13e0f-80c5-478c-99e5-e9de64a8d39a
md"""
De onde resulta o valor de $$\delta_0=$$ $δ₀ °.
"""

# ╔═╡ 1ea9ab83-10c8-4d5f-8489-e9a4754e7b1b
md"""
 $$\delta \to \delta_0 \:(\degree)$$ $(@bind δ₂ PlutoUI.Slider(δ:0.01:δ₀, default=δ,show_value=true)) 
 $$\quad\quad\quad\quad I_{ex} \: (\rm pu)$$ $(@bind K₂ PlutoUI.Slider(0:0.1:1, default=1, show_value=true))
"""

# ╔═╡ 67b54cd9-af1a-4bb7-9a44-c66179adfbcb
begin
	φ₁ = abs(φₙ*π/180)
	δ₁ = abs(δ*π/180)
	I⃗d = (I*sin(φ₁-δ₁))∠(δ-90)
	I⃗q = (I*cos(φ₁-δ₁))∠(δ)
	Id = abs(I⃗d)
	Id = round(Id, digits=3)
	Id, δ-90
end;

# ╔═╡ a2aac898-7c8a-42c6-a7ef-a3ff736d1ab6
md"""
O que permite obter: $$\quad \overline I_d=$$ $Id ∠ $(δ-90)° $$\space\mathrm {pu}$$.
"""

# ╔═╡ cde832b5-50ea-44d8-ae4e-f1907d7e31dc
begin
	E⃗ʼ₀ = E⃗ʼ-j*(Xd-Xq)*I⃗d
	Eʼ₀ = abs(E⃗ʼ₀)
	Eʼ₀ = round(Eʼ₀, digits=3)
end;

# ╔═╡ 33a4d731-3f65-460d-a74e-609250fa6292
md"""
O vector da FCEM de vazio, $$\overline{E'}_0$$, vem então dado por:

$$\overline{E'}_0=\overline{E'}-j(X_d-X_q)\overline{I}_d$$


Assim, obtém-se: $$\quad\overline{E'}_0=$$ $Eʼ₀ ∠ $δ ° $$\space\mathrm {pu}$$.
"""

# ╔═╡ 73b14af8-f204-4070-bab9-180b660a9029
begin
	# Pot. desenvolvida devido à FCEM, pu:
	Pdᶠᵉᵐₚᵤ = (U*Eʼ₀ / Xd) * sin(δ*π/180)
	Pdᶠᵉᵐₚᵤ = round(Pdᶠᵉᵐₚᵤ, digits=2)
	
	# Pot. desenvolvida devido ao efeito de relutância, pu:
	Pdʳᵉˡₚᵤ = (U^2 * (Xd-Xq) / (2*Xd*Xq)) * sin(2*δ*π/180)
	Pdʳᵉˡₚᵤ = round(Pdʳᵉˡₚᵤ, digits=2)
	
	# Resultados
	Pdᶠᵉᵐₚᵤ, Pdʳᵉˡₚᵤ  					
end

# ╔═╡ a97592ef-28ef-4d83-b979-9e5550045cd0
Pdₚᵤ = Pdᶠᵉᵐₚᵤ + Pdʳᵉˡₚᵤ  ;

# ╔═╡ 2635c31e-8a91-45b0-8e4a-b4b6f6e59ae0
md"""
Com: $$\quad I_{exc}=0\space\mathrm {pu}\quad\Rightarrow\quad E'_0\simeq 0\space\mathrm {pu}\quad \Rightarrow\quad P_d^{fcem}\simeq 0\space\mathrm {pu}$$

Por outro lado, o ponto de funcionamento, $$P_d(\delta)$$, em regime nominal é dado por: $$P_d=P_d^{fcem}+P_d^{rel}=$$ ( $Pdᶠᵉᵐₚᵤ ) + ( $Pdʳᵉˡₚᵤ ) = $Pdₚᵤ pu.  
"""

# ╔═╡ f736b324-d6d9-4d8f-93d0-d520b79d4002
md"""
Assim, sem corrente de excitação, a potência desenvolvida devido ao efeito de relutância, $$P_d^{rel}$$, tem de suprir os $Pdₚᵤ pu, do ponto funcionamento.

O valor máximo da potência desenvolvida devido ao efeito de relutância, $$P_d^{rel}(max)$$, verifica-se para $$\delta=-45°$$, que permite obter:
$$P_d^{rel}(max)=\frac{U^2(X_d-Xq)}{2X_dX_q}=$$ $Pdʳᵉˡmax pu
"""

# ╔═╡ c79f1fef-c2f1-45b0-af35-f3e69e6ec77e
begin
	# eixos  d, q:
	plot([0+j*0, (1.3*cos(δ*π/180))+j*1.3*sin(δ*π/180)], 
		label="eixo de quadratura", arrow=:head, linecolor=:black, 
		linestyle=:dashdot,	linewidth=2)
	
	plot!([0+j*0, (0.5*cos(δ*π/180+π/2))+j*0.5*sin(δ*π/180+π/2)],
		label="eixo direto", arrow=:head, linecolor=:black, linewidth=2)
	
	# E⃗':
	K = 0.5 	# fator de escala da corrente
	
	plot!([0, U⃗], arrow=:closed, legend=:topright, label="U∠0°", linewidth=2)
	
	plot!([0, K*I⃗], arrow=:closed, label="I∠φ", linewidth=2)
	
	plot!([U⃗, U⃗ - j*Xq*I⃗], arrow=:closed, label="XqI∠-90°", linewidth=2)
	
	plot!([0, E⃗ʼ], 
			arrow=:closed, minorticks=5, label="E'∠δ",linewidth=2, linecolor=:blue, ylims=(-0.75,0.75), xlims=(-0.25,1.25), size=(600,600))
	
	# I⃗d, I⃗q:
	plot!([0, K*I⃗d],arrow=:closed, label="Id∠(δ-90°)")
	plot!([0, K*I⃗q],arrow=:closed, label="Iq∠(δ)")
	
	#E⃗´₀:
	plot!([U⃗ - j*Xq*I⃗, U⃗ - j*Xq*I⃗ - j*(Xd-Xq)*I⃗d], 
			arrow=:closed, label="(Xd-Xq)Id∠(δ)", linewidth=2)
	
	plot!([0, E⃗ʼ₀], arrow=:closed, label="E'₀∠δ", linewidth=3)		  
end

# ╔═╡ 5861683f-db8a-4d43-9822-f2f47431c191
begin
	# I⃗q:
	Iq₂ = (U/Xq)*sin(abs(δ₂*π/180))
	I⃗q₂ = (Iq₂)∠(δ₂)
	# I⃗d:
	Eʼ₀₂ = Eʼ₀*K₂ 			# K₂: parâmetro associado ao slider "Iₑₓ (pu)" 
	Id₂ = (U/Xd)*cos(δ₂*π/180)-Eʼ₀₂/Xd
	I⃗d₂ = (Id₂)∠(δ₂-90)
	# I⃗, cosφ:
	I⃗₂ = I⃗d₂ + I⃗q₂
	I₂ = abs(I⃗₂)
	I₂ = round(I₂, digits=2)
	φ₂ = angle(I⃗₂)
	fdp = cos(φ₂)			# fator de potência (motor subexcitado -> indutivo)
	φ₂ = rad2deg(φ₂)
	fdp = round(fdp, digits=3)
	I₂, fdp, δ₂, Eʼ₀₂ 		# RESULTADOS
end

# ╔═╡ 9e141f07-ad66-41f4-a53b-b6c25e4afbb2
begin
	# eixos  d, q:
	plot([0+j*0, (1.2*cos(δ₂*π/180))+j*1.2*sin(δ₂*π/180)], 
			label="eixo de quadratura", arrow=:head, linecolor=:black, linestyle=:dashdot,	linewidth=2)
	
	plot!([0+j*0, (0.35*cos(δ₂*π/180+π/2))+j*0.35*sin(δ₂*π/180+π/2)],
			label="eixo direto", arrow=:head, linecolor=:black, linewidth=2, 
			ylims=(-0.75,0.75), xlims=(-0.25,1.25), size=(600,600))
	
	# parte idêntica a polos lisos, E⃗ʼ:
	plot!([0, U⃗], arrow=:closed, legend=:topright, label="U∠0°", linewidth=2)
	plot!([0, K*I⃗₂], arrow=:closed, label="I∠φ", linewidth=2)
	plot!([U⃗, U⃗ - j*Xq*I⃗₂], arrow=:closed, label="XqI∠-90°", linewidth=2)
	
	E⃗ʼ₂ = U⃗ - j*Xq*I⃗₂
	
	plot!([0, E⃗ʼ₂], arrow=:closed, minorticks=5, label="E'∠δ", linewidth=2)
	
	# I⃗d, I⃗q:
	plot!([0, K*I⃗d₂],arrow=:closed, label="Id∠(δ-90°)", linewidth=1)
	plot!([0, K*I⃗q₂],arrow=:closed, label="Iq∠(δ)", linewidth=1)
	
	#E⃗´₀:
	E⃗ʼ₀₂ = E⃗ʼ₂ - j*(Xd-Xq)*I⃗d₂
	
	plot!([U⃗ - j*Xq*I⃗₂, U⃗ - j*Xq*I⃗₂ - j*(Xd-Xq)*I⃗d₂], 
			arrow=:closed, label="(Xd-Xq)Id∠(δ)", linewidth=2)
	plot!([0, E⃗ʼ₀₂], arrow=:closed, label="E'₀∠δ", linewidth=3)
	
	#-jXqI⃗q e -jXdI⃗d
	plot!([U⃗, U⃗ - j*Xq*I⃗q₂],arrow=:closed, label="XqIq∠(δ-90°)",linewidth=3)
	plot!([U⃗ - j*Xq*I⃗q₂, U⃗ - j*Xq*I⃗q₂ - j*Xd*I⃗d₂],
			arrow=:closed, label="XdId∠(δ-180°)", linewidth=3) 
end

# ╔═╡ 9ac8f499-9ab5-4d4f-b65e-b621ce5e74bf
md"""
# *Notebook*
"""

# ╔═╡ 35d7b521-430a-4515-a886-8f6199883030
md"""
Documentação das bibliotecas `Julia` utilizadas:  [Plots](http://docs.juliaplots.org/latest/), [PlutoUI](https://juliahub.com/docs/PlutoUI/abXFp/0.7.6/).
"""

# ╔═╡ 09be49ed-56b6-4a56-ada5-fa4884965d4a
begin
	# other stuff:
	isel_logo="https://www.isel.pt/sites/default/files/NoPath%20-%20Copy%402x_0.png"
	julia_logo="https://github.com/JuliaLang/julia-logo-graphics/blob/master/images/julia-logo-color.png?raw=true"
	version=VERSION
end;

# ╔═╡ 6cd129a9-098f-4079-87a0-fec38b6e7077
ThreeColumn(md"$(Resource(isel_logo, :height => 75))", md"
$\textbf{\color{green}{Lic. em Engenharia Eletrotécnica }}$", md"$\text{ Máquinas Elétricas II}$")

# ╔═╡ b51c4e4b-c10d-4d4a-950b-5b8fbaf3110c
md"""
*Notebook* realizado em linguagem de computação científica `Julia` versão $(version).

**_Time to first plot_**: até cerca de 2.4 min.

**Computador**: Intel® Core™ i5-6300U CPU @ 2.40GHz; 20GB RAM.
"""

# ╔═╡ abfaa6a1-72d3-4497-845c-8d5971ddc5b9
md"""
!!! info
	No índice deste *notebook*, os tópicos assinalados com "💻" requerem a participação do estudante.
"""

# ╔═╡ 30855719-e59e-4ab5-b6f0-a34f63222940
TableOfContents(title="Índice")

# ╔═╡ 3f216ca2-c62b-40d9-8dff-74b09ee991ee
md"""
---
"""

# ╔═╡ 33141ded-ef3f-4d18-835b-033b2c23b998
ThreeColumn(md"Text content: [![](https://i.creativecommons.org/l/by-sa/4.0/80x15.png)](http://creativecommons.org/licenses/by-sa/4.0/)", md" $(Resource(julia_logo, :height => 15)) `code`: [`MIT License`](https://www.tldrlegal.com/l/mit)", md"[$$© \text{ 2022 Ricardo Luís}$$](https://ricardo-luis.github.io/me2/)")

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Plots = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
PlutoTeachingTools = "661c6b06-c737-4d37-b85c-46df65de6f69"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
Plots = "~1.25.2"
PlutoTeachingTools = "~0.2.3"
PlutoUI = "~0.7.23"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "abb72771fd8895a7ebd83d5632dc4b989b022b5b"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.2"

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
git-tree-sha1 = "4c26b4e9e91ca528ea212927326ece5918a04b47"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.11.2"

[[ChangesOfVariables]]
deps = ["ChainRulesCore", "LinearAlgebra", "Test"]
git-tree-sha1 = "bf98fa45a0a4cee295de98d4c1462be26345b9a1"
uuid = "9e997f8a-9a97-42d5-a9f1-ce6bfc15e2c0"
version = "0.1.2"

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
git-tree-sha1 = "dce3e3fea680869eaa0b774b2e8343e9ff442313"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "3.40.0"

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

[[DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "b19534d1895d702889b219c382a6e18010797f0b"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.8.6"

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
git-tree-sha1 = "30f2b340c2fff8410d89bfcdc9c0a6dd661ac5f7"
uuid = "28b8d3ca-fb5f-59d9-8090-bfdbd6d07a71"
version = "0.62.1"

[[GR_jll]]
deps = ["Artifacts", "Bzip2_jll", "Cairo_jll", "FFMPEG_jll", "Fontconfig_jll", "GLFW_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll", "Pixman_jll", "Pkg", "Qt5Base_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "fd75fa3a2080109a2c0ec9864a6e14c60cca3866"
uuid = "d2c73de3-f751-5644-a686-071e5b155ba9"
version = "0.62.0+0"

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
git-tree-sha1 = "0fa77022fe4b511826b39c894c90daf5fce3334a"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "0.9.17"

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
git-tree-sha1 = "2b078b5a615c6c0396c77810d92ee8c6f470d238"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.3"

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
git-tree-sha1 = "a7254c0acd8e62f1ac75ad24d5db43f5f19f3c65"
uuid = "3587e190-3f89-42d0-90ee-14403ec27112"
version = "0.1.2"

[[IrrationalConstants]]
git-tree-sha1 = "7fd44fd4ff43fc60815f8e764c0f352b83c49151"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.1.1"

[[IterTools]]
git-tree-sha1 = "fa6287a4469f5e048d763df38279ee729fbd44e5"
uuid = "c8e1da08-722c-5040-9ed9-7db0dc04731e"
version = "1.4.0"

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
git-tree-sha1 = "f2355693d6778a178ade15952b7ac47a4ff97996"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.3.0"

[[Latexify]]
deps = ["Formatting", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "Printf", "Requires"]
git-tree-sha1 = "a8f4f279b6fa3c3c4f1adadd78a621b13a506bce"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.15.9"

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
deps = ["ChainRulesCore", "ChangesOfVariables", "DocStringExtensions", "InverseFunctions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "be9eef9f9d78cecb6f262f3c10da151a6c5ab827"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.5"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[LoweredCodeUtils]]
deps = ["JuliaInterpreter"]
git-tree-sha1 = "dedbebe234e06e1ddad435f5c6f4b85cd8ce55f7"
uuid = "6f1432cf-f94c-5a45-995e-cdbf5db27b0b"
version = "2.2.2"

[[MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "3d3e902b31198a27340d0bf00d6ac452866021cf"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.9"

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
git-tree-sha1 = "ae4bbcadb2906ccc085cf52ac286dc1377dceccc"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.1.2"

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
git-tree-sha1 = "8fb515c5a2c8941cef957e75afb99a2c24b753f3"
uuid = "995b91a9-d308-5afd-9ec6-746e21dbc043"
version = "1.1.0"

[[Plots]]
deps = ["Base64", "Contour", "Dates", "Downloads", "FFMPEG", "FixedPointNumbers", "GR", "GeometryBasics", "JSON", "Latexify", "LinearAlgebra", "Measures", "NaNMath", "PlotThemes", "PlotUtils", "Printf", "REPL", "Random", "RecipesBase", "RecipesPipeline", "Reexport", "Requires", "Scratch", "Showoff", "SparseArrays", "Statistics", "StatsBase", "UUIDs", "UnicodeFun"]
git-tree-sha1 = "65ebc27d8c00c84276f14aaf4ff63cbe12016c70"
uuid = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
version = "1.25.2"

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
deps = ["AbstractPlutoDingetjes", "Base64", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "5152abbdab6488d5eec6a01029ca6697dff4ec8f"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.23"

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
git-tree-sha1 = "6bf3f380ff52ce0832ddd3a2a7b9538ed1bcca7d"
uuid = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
version = "1.2.1"

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
git-tree-sha1 = "8f82019e525f4d5c669692772a6f4b0a58b06a6a"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.2.0"

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
git-tree-sha1 = "0f2aa8e32d511f758a2ce49208181f7733a0936a"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.1.0"

[[StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "LogExpFunctions", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "2bb0cb32026a66037360606510fca5984ccc6b75"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.33.13"

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

[[URIs]]
git-tree-sha1 = "97bbe755a53fe859669cd907f2d96aee8d2c1355"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.3.0"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[UnicodeFun]]
deps = ["REPL"]
git-tree-sha1 = "53915e50200959667e78a92a418594b428dffddf"
uuid = "1cfade01-22cf-5700-b092-accc4b62d6e1"
version = "0.4.1"

[[Wayland_jll]]
deps = ["Artifacts", "Expat_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "3e61f0b86f90dacb0bc0e73a0c5a83f6a8636e23"
uuid = "a2964d1f-97da-50d4-b82a-358c7fce9d89"
version = "1.19.0+0"

[[Wayland_protocols_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "66d72dc6fcc86352f01676e8f0f698562e60510f"
uuid = "2381bf8a-dfd0-557d-9999-79630e7b1b91"
version = "1.23.0+0"

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
# ╟─9b84722c-af8f-4c83-98b6-d1fb41da86ad
# ╟─b3fd50c7-7840-44a5-a640-2689adde4589
# ╟─6cd129a9-098f-4079-87a0-fec38b6e7077
# ╟─03d786ee-301e-48fb-a213-b24da7b74199
# ╟─589625e8-9b8e-4358-9186-66def36f9adc
# ╟─17bc7f80-c13c-11eb-227f-b125d84c8b40
# ╠═20ed504e-08d1-45b9-8494-c42170182898
# ╟─14ae0471-3eaf-4e46-ad4a-79a7c2ef3632
# ╟─25f9aa0c-efa0-4c8a-bbfb-c5648bf2f8a2
# ╟─0545e797-9d40-48c4-ab96-195959331560
# ╠═342aacbe-df8e-42b9-a7a2-8538476f2a80
# ╟─8a9d2209-ed57-402f-a649-841dcf23b127
# ╟─65dd0a07-ff99-4887-8a86-142248705131
# ╟─8b677658-96a8-40cb-b4cf-1638703dda22
# ╟─4dd894c8-9b9b-474d-9a98-d805328b609e
# ╠═d5d4554e-428a-457a-8fdb-47dc977f9d01
# ╟─3ec74057-fcbb-4d79-8aca-719289c2299e
# ╟─a2aac898-7c8a-42c6-a7ef-a3ff736d1ab6
# ╠═67b54cd9-af1a-4bb7-9a44-c66179adfbcb
# ╟─33a4d731-3f65-460d-a74e-609250fa6292
# ╠═cde832b5-50ea-44d8-ae4e-f1907d7e31dc
# ╟─49053499-f759-4043-a9b8-48f42e45589a
# ╠═c79f1fef-c2f1-45b0-af35-f3e69e6ec77e
# ╟─de577063-d31a-407c-b706-870fb9bfdc58
# ╟─19c628e8-60c9-46d0-9ab8-78e70b8bfa6f
# ╟─2cd26842-6c40-4dc0-9979-da4685630aa1
# ╠═73b14af8-f204-4070-bab9-180b660a9029
# ╟─70fd32b5-44a9-425b-9c87-62bdee2d6dc0
# ╟─6bc18d01-7285-4b7b-9769-3a7d52baae75
# ╟─2635c31e-8a91-45b0-8e4a-b4b6f6e59ae0
# ╠═a97592ef-28ef-4d83-b979-9e5550045cd0
# ╟─f736b324-d6d9-4d8f-93d0-d520b79d4002
# ╠═45b5c9d8-93ce-4b64-8c81-431dcbc6531f
# ╟─60f80e79-eeb8-4b60-801f-98caa28b4dfd
# ╟─9432cc05-5632-4e58-bf15-000783ee628c
# ╟─dd7d16e4-7b01-4aa0-a1ba-ecc7881900fb
# ╟─61609aa9-9feb-4a63-b4e9-2fd9a88f8106
# ╟─33d13e0f-80c5-478c-99e5-e9de64a8d39a
# ╠═892b1d19-c88a-4add-ac18-70e799e01092
# ╟─28da7f3c-97fd-4a80-ad21-eeb201dcc881
# ╠═5861683f-db8a-4d43-9822-f2f47431c191
# ╟─311eecf2-4bd6-44bc-8c67-a680f4fd5d33
# ╟─b47b956c-8880-4c22-aeea-d9a55c518b6a
# ╟─1ea9ab83-10c8-4d5f-8489-e9a4754e7b1b
# ╠═9e141f07-ad66-41f4-a53b-b6c25e4afbb2
# ╟─78a2ef93-5ed1-44f8-8aa9-7e7d8d80a2df
# ╟─c5cc14a5-73c6-4f10-bc3e-bd7b68eddafa
# ╟─5f84cb7b-9779-41d7-87b1-ecd357033c04
# ╟─8603f697-58ec-4c77-8749-4487f2053aff
# ╠═dc95260b-8190-407b-9981-dff1e84acd62
# ╟─9ac8f499-9ab5-4d4f-b65e-b621ce5e74bf
# ╟─35d7b521-430a-4515-a886-8f6199883030
# ╠═cce68c02-32d9-4d2b-bd1a-224aa9c07e1e
# ╟─09be49ed-56b6-4a56-ada5-fa4884965d4a
# ╟─b51c4e4b-c10d-4d4a-950b-5b8fbaf3110c
# ╟─abfaa6a1-72d3-4497-845c-8d5971ddc5b9
# ╠═30855719-e59e-4ab5-b6f0-a34f63222940
# ╟─3f216ca2-c62b-40d9-8dff-74b09ee991ee
# ╟─33141ded-ef3f-4d18-835b-033b2c23b998
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
