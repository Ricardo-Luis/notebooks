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

# ╔═╡ 34e1d2a6-eb86-4bc5-9a3f-b60ee0356335
begin
	using PlutoUI # user-interface do Pluto.jl
	using Plots   # Julia package para gráficos 
	using Dierckx # Julia package para interpolação/extrapolação de dados
end

# ╔═╡ c5d4b89b-e993-42db-95c7-d1c696a62802
html"<button onclick='present()'>present</button>"

# ╔═╡ 6f14b6f7-3eea-4236-95d3-7c5dddc94b4c
md"""
# Máquina síncrona trifásica  
**(pólos lisos)**
## Alternador em regime isolado (Ex.2)
Máquinas síncronas trifásicas, exercício 2:
"""

# ╔═╡ a9743237-6408-406b-a8eb-9cbf8867f9ef
md"""
**Um gerador síncrono, ligação Y, 2300V, 1000kVA, factor de potência 0,8 indutivo,
60Hz, 2 pólos, tem uma reactância síncrona de 1,1Ω e uma resistência do induzido de 0,15Ω. A 60Hz, as perdas por atrito e ventilação são 24kW, e as perdas no ferro 18kW. O enrolamento de campo é alimentado por uma tensão contínua de 200V e o valor máximo de $$I_F$$ são 10A. A resistência do circuito de excitação é ajustável entre 20 a 200Ω. O ensaio em circuito aberto deste gerador é o apresentado na figura seguinte:**
"""

# ╔═╡ 42931953-b637-42f5-b451-ab374a89ea70
(Sₙ, Uₙ, cosφₙ, f, p, Xₛ, Rₛ, pᵣₒₜ, p_ferro)=(1000e3, 2300, 0.8, 60, 1, 1.1, 0.15, 24e3, 18e3)

# ╔═╡ c5955086-72bf-463f-a15c-1b2632086ff2
begin
	Iₑₓ=[0, 0.24, 0.58, 0.93, 1.12, 1.39, 1.67, 1.94, 2.18, 2.55, 2.80, 3.04, 3.29, 3.57, 3.78, 3.97, 4.25, 4.54, 4.94, 5.25, 5.68, 6.13, 6.62, 7.03, 7.55, 8.00, 8.43, 8.92, 9.47, 10.0]
	fem=[20.2, 176.8, 382.8, 626.8, 756.0, 914.0, 1086.2, 1244.0, 1378.0, 1570.0, 1698.6, 1812.8, 1928.2, 2038.2, 2128.8, 2200.8, 2292.0, 2392.4, 2498.0, 2560.0, 2636.4, 2694.0, 2746.4, 2784.8, 2818.2, 2846.8, 2870.8, 2894.8, 2914.0, 2928.2]
	Iₑₓ, fem 
end;

# ╔═╡ 4e44ac99-e751-49f0-a228-c8c34a2861f2
plot(Iₑₓ, fem,
	minorticks=5, title="E₀=f(Iₑₓ)", xlabel = "Iₑₓ (A)", ylabel="Eₒ (V)", label=:none)

# ╔═╡ ab85c3a5-f0b1-4d66-b162-4561a02e82b5


# ╔═╡ b2cfb3de-c46b-40c5-b982-da47b62a0628
md"""
## a) $$I_{exc}$$, alternador em vazio 💻
**Qual o valor da corrente de campo necessário para que a tensão composta do seja de
2300V, quando o alternador funciona em vazio?**
"""

# ╔═╡ c88ac310-ece1-4738-b936-0fcfde134810
md"""
A corrente de excitação define o valor da tensão de vazio no funcionamento do alternador, ou seja, $$U_0=E_0$$. Assim, assumindo que a característica magnética, $$E_0=f(I_{ex})$$, foi obtida para a velocidade síncrona da máquina, o valor da corrente de campo, $$I_{ex}$$, obtém-se por leitura de $$E_0=f(I_{ex})$$ para a tensão de $$2300$$V: 
"""

# ╔═╡ 38fa3ee4-4435-40b9-a47a-ce8292535d75
H1=("Iₑₓ", @bind Iexc PlutoUI.Slider(0:0.01:10, default=0,show_value=true))

# ╔═╡ c64c2444-bb8b-4c52-960e-4c41445a98ca
# Através de leitura do gráfico, E₀=f(Iₑₓ)
begin
	plot(Iₑₓ, fem,
		title="E₀=f(Iₑₓ)", xlabel = "Iₑₓ (A)", ylabel="Eₒ (V)", 
		label=:none, minorticks=10, linewidth=2)
		
	# deslocar a recta vertical até intersectar 2300V em E₀=f(Iₑₓ): plot!([<->], ...)
	plot!([2300], seriestype=:hline, linestyle=:dash, label=:none)
	plot!([Iexc], seriestype=:vline, linestyle=:dash, label=:none)
end

# ╔═╡ 825f12d2-9153-4ee1-9d83-640f49d88d6d
begin
	# Através interpolação linear de E₀=f(Iₑₓ) realizado pelo package Julia, Dierckx:
	i_E₀=Spline1D(fem, Iₑₓ)	
	Iₑₓ_2300=i_E₀(2300)
	Iₑₓ_2300=round(Iₑₓ_2300, digits=2)
end;

# ╔═╡ 24ae7ecd-9423-4edf-bf88-6e71f0e27d82
md"""
Em alternativa à leitura do gráfico de $$E_0=f(I_{ex})$$, pode-se consultar os dados de $$E_0$$ e $$I_{ex}$$ e obter a corrente de campo por interpolação linear. Assim, tém-se:

$$E_0=2300\mathrm{V}\:\in\:[(4.25\mathrm{A}, 2292.0\mathrm{V}),(4.44\mathrm{A}, 2392.4\mathrm{V})]$$

Por interpolação linear, obtém-se:

$$\frac{2392.4-2292.0}{4.44-4.25}=\frac{2392.4-2300.0}{4.44-I_{ex}}$$

 $$I_{ex}=$$ $(Iₑₓ_2300)A
"""

# ╔═╡ 93e6e95e-8d12-450d-9558-ef2780de56f8


# ╔═╡ 4da8eaa3-0c65-4351-9242-adfc95af7353
md"""
## b) $$E_0$$ nas condições nominais
**Qual a fem gerada por esta máquina nas condições nominais?**
"""

# ╔═╡ 4d2962a9-0816-4b25-ae7b-f3c87d375428
md"""
Considerando a equação vectorial da força electromotriz, $$\overline{E}_0$$, por fase:

$$\overline{E}_0=\overline{U}+(R_s+jX_s)\overline{I}$$

Estando a máquina com as ligações em estrela: $$\quad U=\frac{U_n}{\sqrt3}\quad$$ e $$\quad I=I_n\quad$$ com $$\quad I_n=\frac{S_n}{\sqrt3U_n}$$

Assim, o vector da fem vem dado por:

$$\overline{E}_0=\frac{U_n}{\sqrt3}∠0°+(R_s+jX_s)(I_n∠\varphi)$$
"""

# ╔═╡ ab03c270-6924-4c14-9375-3ae600b39250


# ╔═╡ a30977b0-751f-437d-b185-55127263b6bc
md"""
### Diagrama vectorial de tensões
"""

# ╔═╡ c31adb10-b16b-45f3-9f06-ea5c68396dc8


# ╔═╡ f1abeadc-7d88-4cb3-8998-c4242460191e
md"""
## c) $$I_{exc}$$, alternador em carga 
**Qual o valor da corrente de campo necessária para obter a tensão nominal, quando o alternador se encontra nas condições nominais?**
"""

# ╔═╡ 02deedfc-2306-470b-9a16-63b45a5ae638
md"""
Atendendo que os elementos de estudo da máquina síncrona: circuito equivalente, diagrama e equação vectoriais, são representações por fase do seu funcionamento em regime permanente, é necessário ter em conta que a fem entre fases, $$E_{0ff}$$, vem dada por:

$$E_{0ff}=E_0\sqrt3$$
"""

# ╔═╡ b81dee37-67b6-4904-a0ce-1f6bdb48de2d


# ╔═╡ 3d61fd46-c01c-4c9a-ad5a-6182e8adef45
md"""
## d) Potência e binário de accionamento
**Quais os valores de potência e binário necessários para o accionamento deste alternador?**
"""

# ╔═╡ 593c3b9a-76be-4fe3-8f9d-baaf86035b8c
md"""
Considerando o balanço de potências da máquina síncrona em regime alternador, a potência mecânica recebida é dada por:

$$P_{ab}^{mec}=P_u+p_J^{est}+p_{rot}+ p_{Fe}$$

onde, $$\quad P_u=S_n\cos\varphi_n\quad$$ e $$\quad p_J^{est}=3R_sI_n^2$$ 

Assim, o binário de accionamento vem dado por:

$$T_{mec}=\frac{P_{ab}^{mec}}{\omega_{mec}}$$

em que, $$\quad \omega_{mec}=\frac{2\pi f}{p}\quad$$ com $$\quad p\quad$$ sendo o número de pares de pólos da máquina. 
"""

# ╔═╡ 4d673ff6-e368-4c26-88dd-bc105a96e7c6
md"""
Note-se que neste balanço de potências não é considerada a potência no circuito de excitação para o cálculo do binário de accionamento. Sendo um circuito de excitação separada, as suas perdas não intervêm no processo de conversão de energia da máquina. 

Assim, a potência absorvida pelo circuito de excitação, $$P_{ab}^{exc}=U_{ex}I_{ex}$$, é totalmente dispendida em perdas por efeito de Joule, $$p_J^{exc}=R_FI_{ex}$$, por conseguinte, $$P_{ab}^{exc}=p_J^{exc}$$, entrando na determinação do rendimento da máquina síncrona, $$\eta$$, em que todas as perdas envolvidas são consideradas:

$$\eta=\frac{P_u}{P_{ab}^{mec}+p_J^{exc}}$$
"""

# ╔═╡ 4c577232-2e70-4b9f-9ab6-c24b66824b81


# ╔═╡ 5de1389d-a54c-48f0-9c93-4cf46c4c5a4a
md"""
## e) Diagrama P-Q
**Obtenha o diagrama P-Q deste alternador;**
"""

# ╔═╡ 840f2ac8-2282-4cc7-8422-f7e1c078c7e9
md"""
Para a determinação do diagrama $$P$$\-$$Q$$, conhecidas também por *capability curves*, desprezam-se as perdas por efeito de Joule no estator, ou seja, $$R_s=0$$Ω.   

Assim, a partir do diagrama vectorial de tensões resultante, o afixo do vector da tensão, $$\overline{U}$$, marca o início de um sistema de eixos: potência activa (ordenada) e potência reactiva(abcissa).

Os módulos dos vectores: $$\overline{U}$$, $$j X_s\overline{I}$$ e $$\overline{E}_0$$ são multiplicados por $$\frac{3U}{X_s}$$ para se obter uma leitura de potências $$(\mathrm{VAr}, \mathrm{W})$$. Com a máquina em regime nominal são traçados o lugar geométrico das novas grandezas, com as designações:
- limite térmico do estator (lugar geométrico de $$\overline{S}=3U\overline{I}$$);
- limite térmico do rotor (lugar geométrico de $$\frac{3U\overline{E}_0}{X_s}-\frac{3U^2}{X_s}$$);
- Adicionalmente coloca-se o limite mecânico do accionamento/turbina.

No caso de um alternador, a área de funcionamento possível, cumprindo diversos os limites (estator, rotor, turbina), fica delimitada pelas curvas estabelecidas no diagrama P-Q, nos 1º e 2º quadrantes $$(\delta\geqslant0)$$.

"""

# ╔═╡ ffdfe498-9c29-44a1-b31e-19f17b0ba3ab


# ╔═╡ 02f9cc22-91c5-4b01-90bc-3359008b6dc7
md"""
## f) Características externas, cruzando $$(I_n, U_n)$$
**Considerando as condições nominais, obtenha a característica externa, $$U=f(I)$$, para $$\cos\varphi=0.8(i)$$, $$\cos\varphi=0.8(c)$$ e $$\cos\varphi=1$$;**
"""

# ╔═╡ 7111bdc6-fab3-48be-89c1-3ce91de11c57
md"""
O funcionamento do alternador nas condições nominais $$(I_n, U_n)$$ para diferentes factores de potência exige diferentes valores de força electromotriz, que se obtém pela equação vectorial por fase de $$\overline{E}_0$$.  

A determinação da caracterísica externa procede-se como já analisado no exercício anterior.
"""

# ╔═╡ 2b5da421-a849-4d34-b7d8-1acade30ee21
md"""
Determinação da característica externa para $$\cos\varphi=0,8(i)$$:
"""

# ╔═╡ 58caf67b-b57d-47d2-b210-b86e662d117e
md"""
Determinação da característica externa para $$\cos\varphi=0,8(c)$$:
"""

# ╔═╡ ab07ed6e-e3da-469c-a4e9-dfd9524869ce
md"""
Determinação da característica externa para $$\cos\varphi=1$$:
"""

# ╔═╡ 52f522dd-7e25-4841-92b2-7b54ca1040cf


# ╔═╡ 19a1c85d-25af-4aeb-ad7b-2d19396bde89
md"""
## g) Características externas, partindo $$(I=0, U=U_0)$$
**g) Para uma f.e.m de 2500V determine as características externas, $$U=f(I)$$, para $$\cos\varphi=0.8(i)$$, $$\cos\varphi=0.8(c)$$ e $$\cos\varphi=1$$;**
"""

# ╔═╡ 9c27b79c-2c53-44f0-b5e1-5d62570c3ba4
md"""
Determinação da característica externa para $$\cos\varphi=0,8(i)$$:
"""

# ╔═╡ 5530ca56-7421-4521-abeb-566a8bdb9756
md"""
Determinação da característica externa para $$\cos\varphi=0,8(c)$$:
"""

# ╔═╡ c4698c03-47e3-4cb1-9817-a29618327303
md"""
Determinação da característica externa para $$\cos\varphi=1$$:
"""

# ╔═╡ 9be1b929-edba-41ca-b970-4efcf6ec63c7


# ╔═╡ fcf19990-b55d-11eb-3a0a-8fbb3bb1b9bf
md"""
# Setup
"""

# ╔═╡ 9c7efc2d-aa93-4746-ad51-dfca3b5fcd1f
md"""
## Notação polar $$\angle$$. $$\quad$$ Operador $$j$$ $$\quad$$📌
"""

# ╔═╡ f337f42a-0575-402c-ad17-dc86f8e312d5
md"""
Tal como no *notebook* anterior, podemos utilizar a notação fasorial de grandezas complexas através do símbolo $$\angle$$ (para o escrever, fazer: \angle + TAB) através da função:
"""

# ╔═╡ b5f146e5-7ac2-45d4-b98f-4ed80c9b54dd
∠(x) = cis(deg2rad(x))

# ╔═╡ 3fd1cd00-dad1-462b-bb21-263825403472
md"""
Do mesmo modo, se desejarmos escrever números complexos na forma rectangular, mas utilizando a unidade imaginária $$j$$, podemos simplesmente escrever a função:
"""

# ╔═╡ 4a9d2a16-19a7-4614-9227-fe6506ee27d9
j(x) = (x)*im

# ╔═╡ e29ade22-1092-4a05-b078-d5d50509b875
begin
	# Iₙ, φₙ:
	Iₙ=Sₙ/(√3*Uₙ)
	Iₙ=round(Iₙ, digits=1)
	φₙ=-acos(cosφₙ)
	φₙ=rad2deg(φₙ)
	φₙ=round(φₙ, digits=2)
	
	# E₀ₙ:
	E₀ₙ_=(Uₙ/√3)∠(0)+(Rₛ+j(Xₛ))*((Iₙ)∠(φₙ))
	E₀ₙ=abs(E₀ₙ_)
	E₀ₙ=round(E₀ₙ, digits=1)
	
	# δ:
	δₙ=angle(E₀ₙ_)
	δₙ=rad2deg(δₙ)
	δₙ=round(δₙ, digits=1)
	
	# resultados: A, °, °, V 	
	Iₙ, φₙ, δₙ, E₀ₙ  
end

# ╔═╡ 2e347214-cf7b-452f-a041-ad117d869a16
begin
	K=3 # factor de escala da corrente
	Iₙ_=(K*Iₙ)∠(φₙ)
	Uₙ_=(Uₙ/√3)∠(0)
	RₛIₙ_=(Rₛ*Iₙ)∠(φₙ)
	jXₛIₙ_=(Xₛ*Iₙ)∠(φₙ+90)
	plot([0, Uₙ_], arrow=:closed, legend=:topleft, label="U∠0°")
	plot!([0, Iₙ_], arrow=:closed, label="Iₙ∠φ")
	plot!([Uₙ_, Uₙ_+RₛIₙ_], arrow=:closed, label="RₛIₙ∠φ")
	plot!([Uₙ_+RₛIₙ_,Uₙ_+RₛIₙ_+jXₛIₙ_], arrow=:closed, label="XₛIₙ∠(φ+90°)")
	plot!([0,E₀ₙ_], arrow=:closed,
		  minorticks=5, label="E₀∠δ",
		  ylims=(-800,800), xlims=(0,1600), size=(600,600))
end

# ╔═╡ a7d1c835-2494-45ed-a8b2-a2cc89fb8636
# Através de leitura do gráfico, E₀=f(Iₑₓ)
begin
	
	
	plot(Iₑₓ, fem,
		title="E₀=f(Iₑₓ)", xlabel = "Iₑₓ (A)", ylabel="Eₒ (V)",
		label=:none, minorticks=10, linewidth=2)
	plot!([E₀ₙ*√3], seriestype=:hline, linestyle=:dash, label=:none)
	
	# deslocar a recta vertical até intersectar 2300V em E₀=f(Iₑₓ): plot!([<->], ...)
	plot!([5.85], seriestype=:vline, linestyle=:dash, label=:none)
end

# ╔═╡ c653686d-f8d8-48c0-87dd-0b3c8027ce6a
begin
	# Através interpolação linear de, E₀=f(Iₑₓ)
	Iₑₓ_Uₙ=i_E₀(E₀ₙ*√3)
	Iₑₓ_Uₙ=round(Iₑₓ_Uₙ, digits=2)
end;

# ╔═╡ c08ae18e-7857-4dd0-b157-462ef9ab2c34
md"""
Assim, de modo similar ao realizado na alína a), obtém-se uma corrente de campo, $$I_{ex}=$$ $(Iₑₓ_Uₙ)A, por um dos processos anteriormente explicados:
"""

# ╔═╡ 4d172d04-2412-48cf-8136-ccce4fdb0c61
begin
	Pᵤ=Sₙ*cosφₙ
	Pⱼᵉˢᵗ=3*Rₛ*Iₙ^2
	Pab=Pᵤ+Pⱼᵉˢᵗ+pᵣₒₜ+p_ferro
	ωmec=2*π*f/p
	Tmec=Pab/ωmec
	Pab, Tmec 
end

# ╔═╡ 6ff6db51-637d-49c6-815f-e179a9c4ffd5
begin
	# lugar geométrico do limite térmico do estator:
	ϕ=-10:1:190
	S_locus=(Sₙ)∠.(ϕ)
	plot(S_locus, 
		label="limite térmico do estator", title="Diagrama P-Q",
		linewidth=2, legend=:bottomleft, minorticks=5,
		size=(600,600), xlims=(-1500e3,1500e3), ylims=(-1500e3,1500e3))
		
	# lugar geométrico do limite térmico do rotor:
	U=Uₙ/√3
	Q=-3*U^2/Xₛ
	DE=3*U*E₀ₙ/Xₛ
	ψ=-15:1:15
	R_locus=Q.+((DE)∠.(ψ))
	plot!(R_locus, label="limite térmico do rotor", linewidth=2)
	
	# lugar geométrico da turbina (accionamento):
	plot!([-1500e3+j(Pab), 1500e3+j(Pab)], 
		label="limite mecânico da turbina",	linewidth=2)
	
	# eixos: kW, kVAr
	plot!([-1500e3+j(0), 1500e3+j(0)], arrow=:head,
		label="eixo de potência reactiva (VAr)",
		linecolor=:black, linewidth=2)
	plot!([-j(1500e3), j(1500e3)], arrow=:head,
		label="eixo de potência activa (W)",
		linestyle=:dash, linecolor=:black, linewidth=2)
end

# ╔═╡ 9d9ab479-b525-41ee-84ac-7fe5d88b6dfc
begin
	I=0:10:1.5*Iₙ
	cosφ₁=0.8
	φ₁=-acos(cosφ₁)
	Zₛ_=Rₛ+j(Xₛ)
	Zₛ=abs(Zₛ_)
	θ=angle(Zₛ_)
	E₀₁_=(Uₙ/√3)∠(0)+(Zₛ_)*((Iₙ)∠(φ₁*180/π))
	E₀₁=abs(E₀₁_)
	δ₁=asin.((Zₛ/E₀₁).*I*sin(θ+φ₁))  # δ: ângulo de carga, radianos
	U₁=E₀₁*cos.(δ₁).-Zₛ.*I*cos(θ+φ₁)  # cálculo da característica externa
	U₁c=U₁*√3
end

# ╔═╡ f1cb6ed1-a8d8-439d-be7e-f3f62acc67d2
begin
	cosφ₂=0.8
	φ₂=acos(cosφ₂)
	E₀₂_=(Uₙ/√3)∠(0)+(Zₛ_)*((Iₙ)∠(φ₂*180/π))
	E₀₂=abs(E₀₂_)
	δ₂=asin.((Zₛ/E₀₂).*I*sin(θ+φ₂))  	 # δ: ângulo de carga, radianos
	U₂=E₀₂*cos.(δ₂).-Zₛ.*I*cos(θ+φ₂)	 # cálculo da característica externa
	U₂c=U₂*√3
end

# ╔═╡ 947eaafe-4726-4c5a-92ec-27926dbf8e0a
begin
	φ₃=0
	E₀₃_=(Uₙ/√3)∠(0)+(Zₛ_)*((Iₙ)∠(φ₃*180/π))
	E₀₃=abs(E₀₃_)
	δ₃=asin.((Zₛ/E₀ₙ).*I*sin(θ+φ₃))  	 # δ: ângulo de carga, radianos
	U₃=E₀₃*cos.(δ₃).-Zₛ.*I*cos(θ+φ₃)	 # cálculo da característica externa
	U₃c=U₃*√3
end

# ╔═╡ d6f6628a-95aa-4860-bc54-3c065ca2d056
begin
	plot(I, U₁c, 
		title="U =f(I)",
		xlabel = "I(A)", ylabel="U(V)", 
		ylims=(0,3000), 
		framestyle = :origin, minorticks=5, label="cosφ=0.8(i)",
		legend=:bottomleft)
	plot!(I, U₃c, label="cosφ=1")
	plot!(I, U₂c, label="cosφ=0.8(c)")
end

# ╔═╡ da103e2c-d418-4704-968a-39943de1391c
begin
	E₀=2500/√3
	δ₄=asin.((Zₛ/E₀).*I*sin(θ+φ₁))  # δ: ângulo de carga, radianos
	U₄=E₀*cos.(δ₄).-Zₛ.*I*cos(θ+φ₁)  # cálculo da característica externa
	U₄c=U₄*√3
end

# ╔═╡ 6dfefd2d-7a10-4b81-b1af-56aff856573d
begin
	δ₅=asin.((Zₛ/E₀).*I*sin(θ+φ₂))  # δ: ângulo de carga, radianos
	U₅=E₀*cos.(δ₅).-Zₛ.*I*cos(θ+φ₂)  # cálculo da característica externa
	U₅c=U₅*√3
end

# ╔═╡ 5146f962-549c-45c5-93e1-a51f5045724d
begin
	δ₆=asin.((Zₛ/E₀).*I*sin(θ+φ₃))  # δ: ângulo de carga, radianos
	U₆=E₀*cos.(δ₆).-Zₛ.*I*cos(θ+φ₃)  # cálculo da característica externa
	U₆c=U₆*√3
end

# ╔═╡ ae2ce7ad-3670-4691-9f90-1ac77d60259f
begin
	plot(I, U₄c, 
		title="U =f(I)",
		xlabel = "I(A)", ylabel="U(V)", 
		ylims=(0,3000), 
		framestyle = :origin, minorticks=5, label="cosφ=0.8(i)",
		legend=:bottomleft)
	plot!(I, U₅c, label="cosφ=1")
	plot!(I, U₆c, label="cosφ=0.8(c)")
end

# ╔═╡ a7811011-589d-4279-89d2-96e07fe8a2c9
md"""
As funções definidas por `∠(x)` e `j(x)` servem apenas para facilitar a escrita comummente utilizada em engenharia electrotécnica quanto à representação de grandezas complexas. 

Como se pode verificar no exemplo seguinte, no produto de 2 números complexos, um deles na forma rectangular e o outro na forma polar, a linguagem *Julia* devolve-nos o resultado sempre na forma rectangular, com a unidade imaginária representada por `im`.
"""

# ╔═╡ 00acb211-8421-4103-969a-0b97e11cba49
A_=(2+j(10))*(10∠(60))

# ╔═╡ d6db36c2-66bd-44ed-a592-6ad04a27a1e4
md"""
Para obtermos o módulo e argumento do vector $$\overline{A}$$ representado por `A_`, basta utilizar respectivamente as instruções *Julia* `abs`, `angle`,  e ainda `rad2deg` para obter o ângulo em graus:
"""

# ╔═╡ 8a763d47-faa5-4222-86c8-92262107904c
begin
	A=abs(A_)
	α=angle(A_)
	α=rad2deg(α)
	A, α          # resultados
end

# ╔═╡ 66d23e11-bab8-4282-a356-e27a97985a41


# ╔═╡ f5c7545b-e130-4f81-bd8d-2222df5cd9c7
md"""
## Índice
"""

# ╔═╡ 3ffa8570-40c2-4dc9-b1b4-b1a5027df2d2
TableOfContents(title="📚 Índice, Exercício 2")

# ╔═╡ 6e1d3efb-c420-4bcc-b53c-37ba7d1a7e55
md"""
!!! info
	No índice deste *notebook*, os tópicos assinalados com "💻" permitem interacção com o utilizador.  

	O tópico assinado com "📌" deve ser analisado previamente para melhor compreensão dos códigos em linguagem de programação científica *Julia* apresentados no *notebook*.
"""

# ╔═╡ aaeed4d9-43d4-4c45-bdcc-84c07b77f1a7
md"""
## _Julia packages_
*Links to package help*: [Dierckx](https://github.com/kbarbary/Dierckx.jl), [Plots](http://docs.juliaplots.org/latest/), [PlutoUI](https://juliahub.com/docs/PlutoUI/abXFp/0.7.6/)  
"""

# ╔═╡ 2ac98428-5eed-475d-99bf-fd0e272cc896
md"""
!!! info
	## Programação _Julia_ e _notebooks Pluto_
	Saber mais sobre: [_Julia_/_Pluto_](https://github.com/Ricardo-Luis/notebooks/blob/main/ME2/README.md)
"""

# ╔═╡ 5b2f5575-f878-4dff-a3af-7937f81663ea
version=VERSION;

# ╔═╡ 60c1b716-4e88-4037-a300-149c1ed15094
md"""
## _Notebook_

*Notebook* realizado em linguagem de programação *Julia* versão $(version) para a unidade curricular de Máquinas Elétricas 2 (ISEL\LEE).   

Tempo de cálculo do *notebook* (1ª execução): até cerca de 5 min.  

**Ricardo Luís** (Professor Adjunto, ISEL\DEEEA\GDME) \
ISEL, 21/Nov/2021
"""

# ╔═╡ a625719f-a234-4309-9555-ad40ddffe246
md"""
Este conteúdo possui licença [![](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg)](http://creativecommons.org/licenses/by-sa/4.0/).
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Dierckx = "39dd38d3-220a-591b-8e3c-4c3a8c710a94"
Plots = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
Dierckx = "~0.5.1"
Plots = "~1.23.6"
PlutoUI = "~0.7.19"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "0bc60e3006ad95b4bb7497698dd7c6d649b9bc06"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.1"

[[Adapt]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "84918055d15b3114ede17ac6a7182f68870c16f7"
uuid = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
version = "3.3.1"

[[ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

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
git-tree-sha1 = "f2202b55d816427cd385a9a4f3ffb226bee80f99"
uuid = "83423d85-b0ee-5818-9007-b63ccbeb887a"
version = "1.16.1+0"

[[ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "f885e7e7c124f8c92650d61b9477b9ac2ee607dd"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.11.1"

[[ChangesOfVariables]]
deps = ["LinearAlgebra", "Test"]
git-tree-sha1 = "9a1d594397670492219635b35a3d830b04730d62"
uuid = "9e997f8a-9a97-42d5-a9f1-ce6bfc15e2c0"
version = "0.1.1"

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
git-tree-sha1 = "b19534d1895d702889b219c382a6e18010797f0b"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.8.6"

[[Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

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
git-tree-sha1 = "7bf67e9a481712b3dbe9cb3dac852dc4b1162e02"
uuid = "7746bdde-850d-59dc-9ae8-88ece973131d"
version = "2.68.3+0"

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
git-tree-sha1 = "8a954fed8ac097d5be04921d595f741115c1b2ad"
uuid = "2e76f6c2-a576-52d4-95c1-20adfe4de566"
version = "2.8.1+0"

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

[[LAME_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "f6250b16881adf048549549fba48b1161acdac8c"
uuid = "c1c5ebd0-6772-5130-a774-d5fcae4a789d"
version = "3.100.1+0"

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
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Pkg", "Zlib_jll", "Zstd_jll"]
git-tree-sha1 = "340e257aada13f95f98ee352d316c3bed37c8ab9"
uuid = "89763e89-9b03-5906-acba-b20f662cd828"
version = "4.3.0+0"

[[Libuuid_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "7f3efec06033682db852f8b3bc3c1d2b0a0ab066"
uuid = "38a345b3-de98-5d2b-a5d3-14cd9215e700"
version = "2.36.0+0"

[[LinearAlgebra]]
deps = ["Libdl"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[LogExpFunctions]]
deps = ["ChainRulesCore", "ChangesOfVariables", "DocStringExtensions", "InverseFunctions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "be9eef9f9d78cecb6f262f3c10da151a6c5ab827"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.5"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

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

[[NaNMath]]
git-tree-sha1 = "bfe47e760d60b82b66b61d2d44128b62e3a369fb"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "0.3.5"

[[NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[Ogg_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "7937eda4681660b4d6aeeecc2f7e1c81c8ee4e2f"
uuid = "e7412a2a-1a6e-54c0-be00-318e2571c051"
version = "1.3.5+0"

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
deps = ["Base64", "Contour", "Dates", "Downloads", "FFMPEG", "FixedPointNumbers", "GR", "GeometryBasics", "JSON", "Latexify", "LinearAlgebra", "Measures", "NaNMath", "PlotThemes", "PlotUtils", "Printf", "REPL", "Random", "RecipesBase", "RecipesPipeline", "Reexport", "Requires", "Scratch", "Showoff", "SparseArrays", "Statistics", "StatsBase", "UUIDs", "UnicodeFun"]
git-tree-sha1 = "0d185e8c33401084cab546a756b387b15f76720c"
uuid = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
version = "1.23.6"

[[PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "e071adf21e165ea0d904b595544a8e514c8bb42c"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.19"

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
git-tree-sha1 = "ad368663a5e20dbb8d6dc2fddeefe4dae0781ae8"
uuid = "ea2cea3b-5b76-57ae-a6ef-0a8af62496e1"
version = "5.15.3+0"

[[REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[Random]]
deps = ["Serialization"]
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

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

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
git-tree-sha1 = "c45f4e40e7aafe9d086379e5578947ec8b95a8fb"
uuid = "f27f6e37-5d2b-51aa-960f-b287f2bc3b7a"
version = "1.3.7+0"

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
# ╟─c5d4b89b-e993-42db-95c7-d1c696a62802
# ╟─6f14b6f7-3eea-4236-95d3-7c5dddc94b4c
# ╟─a9743237-6408-406b-a8eb-9cbf8867f9ef
# ╠═42931953-b637-42f5-b451-ab374a89ea70
# ╠═c5955086-72bf-463f-a15c-1b2632086ff2
# ╟─4e44ac99-e751-49f0-a228-c8c34a2861f2
# ╟─ab85c3a5-f0b1-4d66-b162-4561a02e82b5
# ╟─b2cfb3de-c46b-40c5-b982-da47b62a0628
# ╟─c88ac310-ece1-4738-b936-0fcfde134810
# ╟─38fa3ee4-4435-40b9-a47a-ce8292535d75
# ╠═c64c2444-bb8b-4c52-960e-4c41445a98ca
# ╟─24ae7ecd-9423-4edf-bf88-6e71f0e27d82
# ╠═825f12d2-9153-4ee1-9d83-640f49d88d6d
# ╟─93e6e95e-8d12-450d-9558-ef2780de56f8
# ╟─4da8eaa3-0c65-4351-9242-adfc95af7353
# ╟─4d2962a9-0816-4b25-ae7b-f3c87d375428
# ╠═e29ade22-1092-4a05-b078-d5d50509b875
# ╟─ab03c270-6924-4c14-9375-3ae600b39250
# ╟─a30977b0-751f-437d-b185-55127263b6bc
# ╠═2e347214-cf7b-452f-a041-ad117d869a16
# ╟─c31adb10-b16b-45f3-9f06-ea5c68396dc8
# ╟─f1abeadc-7d88-4cb3-8998-c4242460191e
# ╟─02deedfc-2306-470b-9a16-63b45a5ae638
# ╟─c08ae18e-7857-4dd0-b157-462ef9ab2c34
# ╠═a7d1c835-2494-45ed-a8b2-a2cc89fb8636
# ╠═c653686d-f8d8-48c0-87dd-0b3c8027ce6a
# ╟─b81dee37-67b6-4904-a0ce-1f6bdb48de2d
# ╟─3d61fd46-c01c-4c9a-ad5a-6182e8adef45
# ╟─593c3b9a-76be-4fe3-8f9d-baaf86035b8c
# ╠═4d172d04-2412-48cf-8136-ccce4fdb0c61
# ╟─4d673ff6-e368-4c26-88dd-bc105a96e7c6
# ╟─4c577232-2e70-4b9f-9ab6-c24b66824b81
# ╟─5de1389d-a54c-48f0-9c93-4cf46c4c5a4a
# ╟─840f2ac8-2282-4cc7-8422-f7e1c078c7e9
# ╠═6ff6db51-637d-49c6-815f-e179a9c4ffd5
# ╟─ffdfe498-9c29-44a1-b31e-19f17b0ba3ab
# ╟─02f9cc22-91c5-4b01-90bc-3359008b6dc7
# ╟─7111bdc6-fab3-48be-89c1-3ce91de11c57
# ╟─2b5da421-a849-4d34-b7d8-1acade30ee21
# ╠═9d9ab479-b525-41ee-84ac-7fe5d88b6dfc
# ╟─58caf67b-b57d-47d2-b210-b86e662d117e
# ╠═f1cb6ed1-a8d8-439d-be7e-f3f62acc67d2
# ╟─ab07ed6e-e3da-469c-a4e9-dfd9524869ce
# ╠═947eaafe-4726-4c5a-92ec-27926dbf8e0a
# ╟─d6f6628a-95aa-4860-bc54-3c065ca2d056
# ╟─52f522dd-7e25-4841-92b2-7b54ca1040cf
# ╟─19a1c85d-25af-4aeb-ad7b-2d19396bde89
# ╟─9c27b79c-2c53-44f0-b5e1-5d62570c3ba4
# ╠═da103e2c-d418-4704-968a-39943de1391c
# ╟─5530ca56-7421-4521-abeb-566a8bdb9756
# ╠═6dfefd2d-7a10-4b81-b1af-56aff856573d
# ╟─c4698c03-47e3-4cb1-9817-a29618327303
# ╠═5146f962-549c-45c5-93e1-a51f5045724d
# ╟─ae2ce7ad-3670-4691-9f90-1ac77d60259f
# ╟─9be1b929-edba-41ca-b970-4efcf6ec63c7
# ╟─fcf19990-b55d-11eb-3a0a-8fbb3bb1b9bf
# ╟─9c7efc2d-aa93-4746-ad51-dfca3b5fcd1f
# ╟─f337f42a-0575-402c-ad17-dc86f8e312d5
# ╠═b5f146e5-7ac2-45d4-b98f-4ed80c9b54dd
# ╟─3fd1cd00-dad1-462b-bb21-263825403472
# ╠═4a9d2a16-19a7-4614-9227-fe6506ee27d9
# ╟─a7811011-589d-4279-89d2-96e07fe8a2c9
# ╠═00acb211-8421-4103-969a-0b97e11cba49
# ╟─d6db36c2-66bd-44ed-a592-6ad04a27a1e4
# ╠═8a763d47-faa5-4222-86c8-92262107904c
# ╟─66d23e11-bab8-4282-a356-e27a97985a41
# ╟─f5c7545b-e130-4f81-bd8d-2222df5cd9c7
# ╠═3ffa8570-40c2-4dc9-b1b4-b1a5027df2d2
# ╟─6e1d3efb-c420-4bcc-b53c-37ba7d1a7e55
# ╟─aaeed4d9-43d4-4c45-bdcc-84c07b77f1a7
# ╠═34e1d2a6-eb86-4bc5-9a3f-b60ee0356335
# ╟─2ac98428-5eed-475d-99bf-fd0e272cc896
# ╟─60c1b716-4e88-4037-a300-149c1ed15094
# ╟─5b2f5575-f878-4dff-a3af-7937f81663ea
# ╟─a625719f-a234-4309-9555-ad40ddffe246
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
