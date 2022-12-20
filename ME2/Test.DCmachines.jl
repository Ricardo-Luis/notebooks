### A Pluto.jl notebook ###
# v0.19.12

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

# ╔═╡ 1b1df283-8089-41fc-b08f-e0e0d72253d8
using Plots,EasyFit, PlutoUI, PlutoTeachingTools, Roots, Dierckx

# ╔═╡ 9b9d7372-f136-499a-a900-e999a2a6784e
ThreeColumn(md"`Test.DCmachines.jl`", md"[![](https://img.shields.io/badge/GitHub_URL-notebook-C09107)](https://github.com/Ricardo-Luis/notebooks/blob/main/ME2/Test.DCmachines.jl)", md"`Last update: 20·12·2022`")

# ╔═╡ ea3e2579-177a-477f-97f6-71ebe0f014cd
md"""
$\textbf{Licenciatura em Engenharia Eletrotécnica }$

$\text{MÁQUINAS ELÉTRICAS 2}$ 

$\textbf{1º Teste de 03 de novembro de 2022 }$ 
---
"""

# ╔═╡ 760a3389-1381-4639-b569-cc70bf240dbc
TwoColumnWideRight(md"**_English version:_** $(@bind z CheckBox())", md"$(ChooseDisplayMode())")

# ╔═╡ 2ad32a6c-a6b5-4244-8f34-cd456a70fe6c


# ╔═╡ c9c8b075-855f-4650-b928-2d9b227fa52d
begin
	if z==false
		md"""
		# Dados
		"""
	else
		md"""
		# Data
		"""
	end
end

# ╔═╡ 7ca9e6c8-5e20-4215-a2eb-97798306a060
begin
	if z==false
		md"""
		Duas máquinas de corrente contínua de iguais características constituem um grupo motor-gerador, a funcionar em regime permanente, de acordo com os dados presentes no seguinte esquema elétrico:
		"""
	else
		md"""
		Two direct current machines with the same characteristics form a motor-generator group, operating at steady state, according to the data presented in the following electrical scheme:
		"""
	end
end

# ╔═╡ e57b94bc-184a-4148-b41b-3627dcb0b611
html"""
<iframe frameborder="0" style="width:100%;height:507px;" src="https://viewer.diagrams.net/?tags=%7B%7D&highlight=0000ff&edit=_blank&layers=1&nav=1&title=me2_T1_03nov2022FIG.drawio#R7V1rc9o4F%2F41fIzHuvj2sUmaZnbSbbfNm%2B7ul4wLDvFbwNSYhPTXrwSWsWQZBJYtKLAz21gYGXSecz866qGr8eJDGk6fPyaDaNSD9mDRQ9c9CKHnQ%2FIPHXlbjQCM%2FdXIMI0H%2Bdh64Gv8K8oH7Xx0Hg%2BiGXdjliSjLJ7yg%2F1kMon6GTcWpmnyyt%2F2lIz4p07DYVQZ%2BNoPR9XRb%2FEge16N%2BtBbj99G8fCZPRm4weqdcchuzqeYPYeD5HU1tPxx6H0PXaVJkq3%2BGi%2BuohFdPbYuqxW4qXm3%2BGJpNMlUPjCNL74%2BPPb%2FvbjNrj0IXvAi%2BHGB82V%2BCUfz%2FBfn3zZ7Y0uQJvPJIKKzgB66fH2Os%2BjrNOzTd18J1cnYczYe5W%2FPsjT5USwVIiODOCWEiZMJuZ4lczp%2BOUzDQUy%2B91UyStLlU9DT8kXee4pHo9L45Tv6X%2Bkz16X5Jkm6nC9M%2Bzl0HLv4EqVJguWLvJMmWZh%2FNqB35r8%2BSrNoUbuuoKAWwXmUjKMsfSO35B9wHWhBZ%2FWpHOXY9ouh1zVqcgLZzyXAQBdY%2BZ1hDtVh8Yg1NckfOUF3IC6qkDIaEHDnl3TpkmEyCUfv16OXa2LT5Vnfc5ck05zE%2F4%2By7C1f7nCeJTwAosngHeU7%2BgSCqtXITTyqBwhZ5%2FTt7%2FyJy4t%2F6IXlYocNXC%2FKb1%2B%2Fla8%2BR2lM1itK88HVj6a%2FdDNBiSAJ02GUD71%2Fvb1%2FuPuSPtw%2Fpk92f%2Fzx6X5%2BUUP4NBoREL3w88uol3%2F0cxKTJxeAgb7NocVhTMimIFyS9qP8UwIGiq%2BhBIv6X7WZ5af02VH6%2FoUs2SwnHGWSmAjGu%2FB7NPqczOKcj74nWZaMKWWZgKNUGISz5wJG4Sge0lv70WRJpzJe2LTv8nsyijM615R%2Bl%2FFiSBWLFY0Iz6f0PiueDOb9LElnxV%2BPjhRXcl6X4KDC%2FrW8DgHiSOcyli5xOcASNkd2PUpUeVxKTNcIjy%2FibMmwlpNf%2FVN6Z82s9OKtdCGyaklWTJJJxMkKu0ZWMBsBbCTpioU2rBuUionueX0lgyq8TpYlfCvdtmTIWf1zEJA%2FZw2t1Yz7ChKpfglMYg%2BUkGdTbbs7%2BORqZy%2Blo6b1ShaJvXxJMa6uwFRRXlZ0f3zADzdfw8%2Fu9NsbuH%2BOR9d%2FD1b3NQB%2FIxEGj1sfpdEsni310TTJyIRxsgTGo9zYKSmlC21aCfPMj0FQ1Uq2RCuJwkgbSR0ZTd1RRs37ZCm31sR1f84T9sbFbMn278gNEE8X6zep6xb2%2BQ88ROkgnITlm9wh%2FTdjzyLfffW41XgFVmR9M5n7wvg0V0pljyQfqiBIhM04HgyWAk%2FmL%2FFCsIAm0AQHQecgr%2BqKyGwU2BoasEk0zE4bDaJlgGFVOHSLBsckGq5OGw2FI8LsRMabxtDgmUTD9RkNnDsbeJ2hQepRQKMuBfMUSn5ArUdB0XITjuMRHbgnvgBRM%2Faf0Sv5%2F5dkHE7yW%2FJnQm%2BJmDDNBH93OVbyeNU84u79CK%2Bhg6DmHSOnHe8Y%2B4H0Oa16xwibxDI4KCw39okLZx3wznrrMWJF1uB9bDke7FZ4CAeCDFeMMOmKJkOZAq%2FNINk1eq5WsW6GhZArKu5sIfSLIeYtJ5mTjbp0sqG%2FfeXJNPF0VmddlFY9nE1X6dOneEEp1YQMN8uXpmVH0BKSaz6qLjzA1YUvBvWvfNDYaMUOb7Su7M6Px2WP6qCvGwj0lTFWpy4JUghIDslCTNV%2FflGfEH5nM9Rog2JZkLgsTnVZWJiNQ31ry6JQKlA1XzmXZWOdQHU1N1Jna%2BamvE4S%2BLCxpiYsRyRx8WsyuZVZnM3TtKzCkUJGuErZ34mYO9OrNQLJ3eKjcSVkiTYD7kU3rvKXj3e%2Fktv%2FvX6Ck4fLr85kencfrhLy2q38CyFSgxGwbB%2BtX15bgKz%2FkcebshvHsz75leEkSuYz62k%2Bix6hFBfl2rXXaJZJJZu6zVOE4LElScm4EmWOmivz%2BoTv8RJwnXNlfy0JKCs1lHgrxCV6yJ%2FcRjoW8zVCMJBUAiIJrYGGBLtUfTi%2BSfVxjqrWMSFyWtEVPgaWAwMMgOdiz3bksc%2BubBfXPhbb5Qw%2BDeADwLUtTF6B7wZeAFyPQ5%2FnthPhJ5iXPkdXhH%2FDEv7%2BoU%2FPc7nF7TT0KV95BQP06EOfno%2BNhj7lK988Xy8PfX44udCnD0El9OlX3YKWQp9y6iqkFNoOffrAqYQ%2Bq8siC30Gba2KLNzfauRzI3FMB8ukkU9h7fcMfAqz6DNNpQuqsvmtcdzzoEl5OHFP6TK5uwWmv4%2BS%2Fg%2Fy2ckmKsGeeh2C6m4T02RkpZ6eUE6DbIvw1Pq1H4%2Fi6rRtoWDx849%2F3z7f%2Frp0v%2F3469PTX%2FH95fQCKrDpHmZ2mW0rENBpx0Fh%2FbBXrbmUbQ0VXSVt8SCFio0dxR6%2F%2FLx%2FKzAR5zIvOVbiMy%2Bv2aeKCh9dm3WkTLt1h%2Bgu0f5u%2BD3gA42VyM5WBi%2BSCe045cL3w3mesdWqO6Bfp%2B8L7pp4UBXb0lhVXtlmbkubOpdsrZGTcJOceMgoO0ErsJ21tuSdENezLduGNnsJ06sq02IfFgtUOcLuf028B71A%2Bpx2mY8B4txxQMYp2oOt0PMt17FFTDKS264StLaWZbu%2BGti1lTs4RmB0LnfYLNp3Etma6x2I%2BBLbpLSct2Kp92NNkTevcdivKw4jGJZUcbZU4SCnn5maqZ11kTHlIRgIzDrfWVv4W%2BZpWVkAWSqosw2Ed8eVtZBsIGzW%2B0qIbLAsrKn9g0CWv%2BgMDF9OGwwBH8tH0DQYzGwm3d8bEfa2QdPtz2AregcEvMJAAXG8oB5PpYiAd%2BWpyKJNzeQNExnEfMEO%2BXnOFb3Pufo0jobhaviIxYyCc6RBEolt2rrseSHHiSyRpQ8nNAJ2xsnuOAHi3lnbkxRm%2B7KQY1s9O5mX2RJSvjyGS91CC4RODjE1xd6NIIR8oVaFbWkyJmoU4hZNilXWsVMLBz5vsQROsI%2FJUglducvX3sbMAeYWoKCQFFu%2BVgswkG3ZgVvkKHxuWuJ8W67nFe%2B6agFgbdaQUVe8By%2BPWHxpEEUXjuCNI9NWj9HeThdnNJTR4Bm3gfXHZsqWDQZOYdGkY3LzwymYNDqAIrYodqpNwDo1gZHZnta9plUYv%2B0%2Boi7bGkEvsEqVi4Kh4zm443SgSveLQ04H7t01fyA5bkOD1EE%2B307JZSKmJHVkW4qAjj1Fcgq363kTu92Dp%2Bdz64CKsINVBpVuFZRnREEdS5mTuV540PfJjyspDX7fogc0FUR5rGtuR2kG6baszhypmyOWUDrEDxAdKcMRPul2tM7Q8P600YArbrVhNGBZakkgRZkG6uZm7aqLZubqnD1oze%2Fn6STXUZfLE%2F%2BwFWA6NR27jUL6KIQtn0aJBwtIr5CFPanyqjsGrmSfuqJ9ynq%2BaKCzK7b7lFQzAFZw2w2hJXH807U6tpoYrAtP%2B4V0AEC%2ByYWDhTlaNg9cMwf9adu2cloBE9xOxTRBoWO5pRefl1RtvKILk%2FjIy6cbnjLYrCzBFuoqXZnyaeuYQTk5jXagPJBzBivsv53XncNRQpo2lgHgyB%2FU6s4yrNBq6ZDFiZZD4hoKFZ%2BnG5adXdrWKXFyohqtF8hO25GtCAzEunwZ82SNlgsc%2F8FgDcWDJ4h1p7tTA%2BVwMBr0vD7DgTdBg%2B5ak8nhoNCEq%2BUuMA3lLRD0r%2BRYzk7bwLBI5jmg1JmJ7nDpKaFDw7r4fNf8FJkZW3yFqbc%2BN6ejKJRzbM0f2txutT082Z1naGM%2BlI0CsPeGK184alq155A2kEHtRgG34cpzziUaOiJWRUspU%2BaCI4s%2FnndcmQcKEuxK2%2B9wy5V0m6u3246Z7%2BEsuiYrt82a5EOMit2DD6STJLBtyJsTohWq3O8KCAQveljrjkuKX5k9qNW45Ploe6MhLOF0AfNax0znquNpOlOJK6iKA4lgsbfM1LYpajR6%2FfPEWd92ROob3t7k6tcE543b1Y3blT0JGlqWsf41tnDMiekdc67RjVCH3wfxkKp63LaOU4JbAi5tH9915Il3U20Q2QegUC%2BMWDDOVF9E1%2BhhgGehspNQ8VoSKmJ31Y6LA11Zpv8sVPYWKsV%2BJGNCpeUTkpp3iDEWSYMetLBdl%2FRDLj2ihZ9UObQGPSHn17Ft4JnJ%2BGlSJVoPSzgtvcS6LG7Ncja2ipudcyMRQod57vEZn4bw2dTAaobPI%2B8psS5qfgnTmJ7v%2BFgcx64Y2amCbpMJxfpP0BPcb3v6golYsIcdtrGvZCO4EhuhKJfWDw0zW7pOtzYLucBCpdosoTbasS22%2F3LnRAWqhnAsrFabtXMSdMOzWs2DekeS%2BPpt8VrZ7WfZ%2FvpgIF3QpfMCUDlwqG0Urx7bAYrPDSyNJvWQWF3oGs7ne0a3pJx4B8sKHIy3sPQUwlz9efpSrEJJQfVH4WwW93ky8Qu4t72s18EyFipDQpslLJrXypExJFSZeCIkdBWdYWFTh5NLrFbVFDuOr6VSA3q%2B87mT6l4CS2gV5UBk%2BjwB1maRwwqlJnAEKr9jVD5Icu4hG%2Bm1TDJqoLTYvRIGVTLLAgat9WfwFdL05Rpmeu72%2FXM8kRGW6QxY40%2FJ1lStX8LBqBrf40t9iMizCBHFJM2ueieoTqukdrQpBpn%2Fcmb2hszuC6fEmGd2mVdCyTk5U1W9wRuAFuSjJlhyZmm3hJVteacUvX%2FseZfjqN%2FzrqkxD%2BmxzzxD%2Fzk%2B016d9qhCe1fSDUUT7cllmlA7ey3qaSblYzKI6B3%2FAQ%3D%3D"></iframe>
"""

# ╔═╡ 1e9ffcd8-aaab-4387-a60e-930deaf1f24a
begin
	if z==false
		md"""
		Conhecem-se ainda os seguintes dados:
		"""
	else
		md"""
		The following data are also known: 
		"""
	end
end

# ╔═╡ 616efd77-a81e-4242-9110-cb73b7953497
begin
	α = 1/300 			# turns ratio, α=Ns/Nf
	pᵣₒₜ = 3000 		# W, pᵣₒₜ: rotational losses (mechanical and core losses)
	ΔE = 12.9 			# V, ΔE: voltage drop due to armature reaction (for Iₐ=150A)
end;

# ╔═╡ 929cbbe0-5167-11ed-22ad-3d923623a1e8
begin
	i=[0; 0.2; 0.4; 0.6; 0.8; 1.0]  		# A, field current values
	E=[5; 180; 225; 240; 246; 250]   		# V, FEM values
	n_mag=1000 								# rpm, speed of the no-load characteristic
end;

# ╔═╡ 1ceaa326-46f1-4dba-8288-2d06345ca41d
begin
	if z==false
		md"""
		Característica magnética às $(n_mag) rpm:
		"""
	else
		md"""
		No-load characteristic at 1000 rpm:
		"""
	end
end

# ╔═╡ b64be4f2-d16c-4d40-8437-4bad945cff01
begin
	FIT_E = fitexp(i, E, n=2) 			# Trendline for no-load characteristic
	
	# Interpolated no-load characteristic
	E_i = Spline1D(FIT_E.x, FIT_E.y, k=3, bc="extrapolate") # to obtain FEM
	i_E = Spline1D(FIT_E.y, FIT_E.x, k=3, bc="extrapolate") # to obtain field current
	
	scatter(i, E, xlabel = "i (A)", ylabel="E (V)", legend=:none)					# plot no-load data points
	plot!(FIT_E.x, FIT_E.y)			# plot the trendline
	
	# To test the interpolated no-load characteristic:
	
	#If = 0:0.01:1 				
	#U0 = 5.01:1:250
	
	#i2E = E_i.(If)
	#E2i = i_E.(U0)
	
	#plot!(If, i2E)
	#plot!(E2i, U0)
end

# ╔═╡ a6ff8b62-6fd0-45ff-8453-2c5b0a630219
begin
	if z==false
		md"""
		## Dados do grupo motor-gerador
		"""
	else
		md"""
		## Electric circuit data of motor-generator set 
		"""
	end
end

# ╔═╡ 62df9520-f4b6-41e5-a75f-8ad257ef3529
begin
	# DC motor-generator set (identical machines)
	Rₐ = 0.114   		# Ω, armature resistance
	Rf = 250 	 		# Ω, shunt/independent field inductor resistance
	Rₛ = 0.072 	 		# Ω, serie field inductor resistance
	Tmec = 328.65 		# Nm, mechanical torque

	# Generator
	Iₐᴳ = 150 			# A, armature current
	Rᵣₕᴳ = 575 			# Ω, Rf field rheostat
	Uᴳ = 330 			# V, output/load voltage

	# Motor
	Iₐᴹ = 150 			# A, armature current
	Rᵣₕᴹ = 580 			# Ω, Rf field rheostat
	Uᴹ = 415 			# V, input/supply voltage
end;

# ╔═╡ 016d56be-2d99-4a20-9908-a4fb7c347af0


# ╔═╡ 7d2b527d-da2b-4704-a931-3cc06d5a5215
begin
	if z==false
		md"""
		# I - Gerador
		"""
	else
		md"""
		# I - Generator
		"""
	end
end

# ╔═╡ 4153a634-6797-449f-8c5b-25355b6a5507
md"""
## a) $n \to (I_n, U_n)$ 
"""

# ╔═╡ fc2bd53a-7d0c-4ca8-adef-ddf7b700954b
begin
	if z==false
		md"""
		**Determine a velocidade de acionamento necessária para o gerador funcionar nas condições indicadas;**
		"""
	else
		md"""
		**Calculate the drive speed required for the generator to operate under the indicated conditions;**
		"""
	end
end

# ╔═╡ b2792a51-9371-4406-9224-ba96588827c7
begin
	if z==false
		md"""
		Cálculo da corrente de excitação do gerador DC:
		"""
	else
		md"""
		Calculation of DC generator field current:
		"""
	end
end

# ╔═╡ 54ccccd5-a2ce-42cf-85c5-8640fa0afcb4
Ifᴳ = Uᴳ / (Rf + Rᵣₕᴳ) 		# A, field current

# ╔═╡ 42335ad4-de0a-4ebd-9c2a-729c4a23cf7d
begin
	if z==false
		md"""
		Leitura da força eletromotriz na característica magnética às 1000rpm para o valor da corrente de excitação obtido:
		"""
	else
		md"""
		Electromotive-force from no-load magnetic characteristic at 1000rpm for the obtained field current:
		"""
	end
end

# ╔═╡ eb2b2d53-f1b3-4798-b2fc-ba42b2914826
begin
	E₀ᵐᵃᵍ = E_i(Ifᴳ)		# V, read electromotive force from no-load curve for Ifᴳ
	kϕ₀ = E₀ᵐᵃᵍ / n_mag  	# V/rpm, magnetic flux (optional)
	E₀ᵐᵃᵍ, kϕ₀
end

# ╔═╡ da08e82c-f364-4102-9648-cf400cea0578
begin
	if z==false
		md"""
		Considerando a queda de tensão nas escovas desprezável, $$\Delta U_{brushes} \approx 0 \rm V$$, a força eletromotriz (FEM) do gerador DC, para as condições de funcionamento indicadas, vem dada por:

		$$E_0=U^G + R_a I_a^G + \Delta E$$
		"""
	else
		md"""
		Considering that voltage drop on the brushes is negligible, $$\Delta U_{brushes} \approx 0 \rm V$$, the electromotive-force (EMF) of the DC generator, for the indicated operating conditions, is given by:
		
		$$E_0=U^G + R_a I_a^G + \Delta E$$
		"""
	end
end

# ╔═╡ a5964481-bfc3-429a-94af-6eac8d7335b2
E₀ = Uᴳ + Rₐ * Iₐᴳ + ΔE  	# V, FEM

# ╔═╡ 9e81564f-a752-4fcf-8309-aedbf46e3d21
begin
	if z==false
		md"""
		Como a FEM do gerador DC é diretamente proporcional ao fluxo magnético e à velocidade de acionamento, para as condições de funcionamento indicadas, vem dada por:

		$$E_0=k\phi_0 \: n$$

		e $$k\phi_0$$ depende unicamente da corrente de excitação, ou seja:

		$$k\phi_0=\frac{E_0^{mag}}{n_{mag}}=\frac{E_0}{n}$$

		Assim, a velocidade do grupo motor-gerador, vem dada por:
		"""
	else
		md"""
		As the EMF of the DC generator is directly proportional to the magnetic flux and the drive speed, for the indicated operating conditions, it is given by:

		$$E_0=k\phi_0 \: n$$

		and $$k\phi_0$$ depends only on the field current, that is:

		$$k\phi_0=\frac{E_0^{mag}}{n_{mag}}=\frac{E_0}{n}$$

		Thus, the speed of the motor-generator set is given by:
		"""
	end
end

# ╔═╡ e4cba508-69ed-4c0d-b3d8-85cd67b375e0
begin
	nᴳ = (E₀/E₀ᵐᵃᵍ)* n_mag  	# rpm, speed 
	# nᴳ = E₀ / kϕ₀ 			# rpm, speed (other option)
	nᴳ = round(Int, nᴳ) 		# rpm, speed rounded to unit
end

# ╔═╡ cd05b997-f3ec-4e7f-a590-75fb3f8c5eca


# ╔═╡ 99718cff-350e-4614-a9bc-b8995e5c1024
begin
	if z==false
		md"""
		## b) $n$ através do balanço de potência. $\eta$ do grupo motor-gerador
		"""
	else
		md"""
		## b) $n$ using gen. power balance. $\eta$ of motor-gen. group
		"""
	end
end

# ╔═╡ c115c741-514d-4237-8c92-c9a7e51dbec0
begin
	if z==false
		md"""
		**Utilize o balanço de potências do gerador para confirmar o resultado anterior. Determine o rendimento do grupo motor-gerador;**
		"""
	else
		md"""
		**Use the generator power balance to confirm the previous result. Determine the efficiency of the motor-generator group;**
		"""
	end
end

# ╔═╡ b794ec89-73ba-4543-86db-47b930ba2cd2
begin
	if z==false
		md"""
		Através do balanço de potência de cada máquina DC obtêm-se as respetivas potências absorvidas e úteis:
		"""
	else
		md"""
		Through the power balance of each DC machine, the respectives inputs and output powers are obtained:
		"""
	end
end

# ╔═╡ 12461786-f362-4f7b-9f1c-1ea0b6256947
Pᵤᴳ= Uᴳ * Iₐᴳ 			# W, generator output power

# ╔═╡ 39917674-e6ad-405f-bc66-1d37437b4fda
pⱼfᴳ = Uᴳ*Ifᴳ 			# W, generator field circuit Joule losses

# ╔═╡ a0a91e9b-0816-45ca-b46e-da7206406352
pⱼₐᴳ = Rₐ * Iₐᴳ^2  		# W, generator armature Joule losses

# ╔═╡ 93b2bdb6-0c50-459f-8a05-5b9f94276b17
Pmec = Pᵤᴳ + pⱼfᴳ + pⱼₐᴳ + pᵣₒₜ 		# W, generator/motor input/output power

# ╔═╡ 9f8bb91a-685f-4f3b-9826-2aa05c7fbe16
Pᵢₙᴹ = Uᴹ * Iₐᴹ + (Uᴹ^2)/(Rf+Rᵣₕᴹ)		# W, motor input power

# ╔═╡ 0cd99825-9f0f-420e-904f-412ca8f88660
begin
	if z==false
		md"""
		O rendimento do grupo motor-gerador é obtido por:
		
		$$\eta=\frac{P_u^G}{P_{in}^M}$$

		Ou através do produto dos rendimentos de cada uma das máquinas DC:
		
		$$\eta=\eta^M \: \eta^G =\frac{P_u^M}{P_{in}^M}\frac{P_u^G}{P_{in}^G}$$

		onde se considera que o acoplamento mecânico entre as máquinas DC é perfeito, ou seja: $$P_u^M=P_{in}^G=P_{mec}=$$ $(Pmec) $$\rm W$$
		"""
	else
		md"""
		The efficiency of motor-generator set is obtained by:
		
		$$\eta=\frac{P_u^G}{P_{in}^M}$$

		Or through the product of the efficiency of each DC machines:
		
		$$\eta=\eta^M \: \eta^G =\frac{P_u^M}{P_{in}^M}\frac{P_u^G}{P_{in}^G}$$

		where it is considered that the mechanical coupling between the DC machines is perfect, that is: $$P_u^M=P_{in}^G=P_{mec}=$$ $(Pmec) $$\rm W$$
		"""
	end
end

# ╔═╡ 1fcd9e30-cd4e-4aff-b52d-0d4a84c34d9d
begin
	ηᴳ = Pᵤᴳ / Pmec 		# Generator efficiency
	ηᴹ = Pmec / Pᵢₙᴹ 		# Motor efficiency
	ηᴹᴳ = ηᴹ * ηᴳ 			# Motor-generator set efficiency

	# percent values and their rounded values
	ηᴳ=round(ηᴳ*100, digits=1)
	ηᴹ=round(ηᴹ*100, digits=1)
	ηᴹᴳ=round(ηᴹᴳ*100, digits=1)

	#results:
	ηᴳ, ηᴹ, ηᴹᴳ
end

# ╔═╡ 6c53cb0f-ed8c-44b8-a989-20f7681c4596
begin
	if z==false
		md"""
		Conhecidos o binário mecânico e potência mecânica aplicados ao gerador DC, $$T_{mec}$$ e $$P_{mec}$$, obtém-se a velocidade de acionamento:
		"""
	else
		md"""
		Knowing the mechanical torque and mechanical power applied to the DC generator, $$T_{mec}$$ and $$P_{mec}$$, the drive speed is obtained:
		"""
	end
end

# ╔═╡ 765f1a81-ed15-48a2-b2a5-184410410736
let
	nᴳ = Pmec / Tmec 			# rad/s, angular speed of motor-generator set 
	nᴳ = 60 * nᴳ / (2π)         # rpm, angular speed units conversion: rad/s → rpm
	nᴳ = round(Int, nᴳ)			# rpm, drive speed rounded to unit
end

# ╔═╡ 013705ab-87fc-4cf8-a523-a4dd412a06ff


# ╔═╡ 2b3f8456-6b70-4b7f-997c-a7d94db46c6b
begin
	if z==false
		md"""
		## c) 💻 $U=f(I)$: derivação, independente, composta aditiva
		"""
	else
		md"""
		## c) 💻 $U=f(I)$: shunt, independent, compound aditive
		"""
	end
end

# ╔═╡ 0a6f6c04-7856-495f-ac62-09c865e60472
begin
	if z==false
		md"""
		**Trace qualitativamente e de forma comparativa as características externas do gerador nos modos de excitação: derivação, independente e composta aditiva. As três características têm de passar pelo ponto de funcionamento nominal, $(I_n, U_n)$.**
		"""
	else
		md"""
		**Trace qualitatively and comparatively the external (load) characteristics of the generator in the excitation modes: shunt, independent and additive compound. All three characteristics must pass through the rated operation point, $(I_n, U_n)$.**
		"""
	end
end

# ╔═╡ e0b9823e-1e98-4b87-a96f-c9472806f957
begin
	if z==false
		md"""
		> Para a resolução desta questão optou-se pelo desenvolvimento de uma solução quantitativa, determinando computacionalmente a solução numérica de cada característica externa, tirando partido da linguagem de programação científica `Julia` e do ambiente interativo do *notebook* `Pluto.jl`.
		"""
	else
		md"""
		> To solve this question, a quantitative solution was developed, computationally determining the numerical solution of each external characteristic, taking advantage of the scientific programming language `Julia` and the interactive *notebook* environment `Pluto.jl`.
		"""
	end
end

# ╔═╡ e645b64d-c6a3-48b0-8ed0-5525bef418e1
begin
	if z==false
		md"""
		Escolha os valores nominais $$(I_n,\: U_n)$$:
		"""
	else
		md"""
		Choose the nominal values $$(I_n,\: U_n)$$:
		"""
	end
end

# ╔═╡ acd3ce49-2f6b-42a2-ba90-03c46f539fb7
md"""
 $$I_n (\rm A):$$ $(@bind In PlutoUI.Slider(0:1:200, default=150, show_value=true)) $$\quad\quad\quad U_n (\rm V):$$  $(@bind Un PlutoUI.Slider(0:1:250, default=200, show_value=true)) 
"""

# ╔═╡ afee0704-03a6-4403-afe0-56b5a4a1df40
begin
	if z==false
		md"""
		Modifique a tensão de vazio, $$U_0$$, para cada tipo de excitação, para que a respetiva característica externa contenha $$(I_n, U_n)$$:
		"""
	else
		md"""
		Change the no-load voltage, $$U_0$$, for each field type generator, in order to load characteristic contain $$(I_n, U_n)$$ in the plot results:
		"""
	end
end

# ╔═╡ cd5aeeee-5ab6-4589-a6e7-25fb6115b283
md"""
| **Shunt** | **Independent** | **Compound⁺** |
|:-----:|:-----:|:-----:|
| $$U_0\:(\rm V)$$ | $$U_0\:(\rm V)$$ | $$U_0\:(\rm V)$$ |
| $(@bind U₀ₛₕ PlutoUI.Slider(6:1:250, default=175, show_value=true)) | $(@bind U₀ᵢₙ PlutoUI.Slider(6:1:250, default=175, show_value=true)) | $(@bind U₀ᶜᵒᵐᵖ PlutoUI.Slider(6:1:245, default=200, show_value=true)) |
"""

# ╔═╡ ffd3f7c6-e424-4d35-b711-b1e78bf565b0
begin
	if z==false
		md"""
		!!! nota
			Neste exercício interativo, o estudante deverá ficar a perceber como ajustar a tensão de vazio do gerador para cada tipo de excitação, de modo que a respectiva característica externa passe no ponto de funcionamento escolhido. 
		"""
	else
		md"""
		!!! note
			In this interactive exercise, the student should understand how to adjust the no-load voltage of the DC generator for each type of field circuit, in order to each external characteristic crosses the chosen operating point. 
		"""
	end
end

# ╔═╡ 2131ec25-bbcc-4fb4-abc7-c4d2aaf149cd
#= to check intermediate results
begin
	plot(Ifₛₕ, E₀ₛₕᵐᵃᵍ)
	plot!(Ifₛₕ, Uᶠ[:, 1:10:c], ylims=(0,300))
	plot!(Ifₛₕ, Rfₛₕ*Ifₛₕ)
	
end
=#

# ╔═╡ 65b12308-3fd2-4bc3-802f-f45d59c3dd0a
begin
	if z==false
		md"""
		### Cálculos auxiliares
		Nos 3 blocos de código `Julia` seguintes são efetuados os cálculos de engenharia para determinação das curvas características externas, apresentadas no gráfico anterior, relativas ao funcionamento do gerador DC nos modos de excitação: independente, derivação e composta aditiva. 
		> Não necessita de preocupar-se em perceber esta secção em detalhe!
		"""
	else
		md"""
		### Auxiliary calculations
		In the next 3 `Julia` code snippets, the engineering calculations are carried out to determine the external characteristic curves, shown in the previous graph, related to the DC generator operation in the field circuit modes: independent, shunt and cumulative compound.
		> No need to worry about understanding this section in detail!
		"""
	end
end

# ╔═╡ 5b9a8efb-8068-44b9-aa6f-3979907e8838
begin
	# Independent generator load characteristic
	Iₐᵢₙ = 0:1:2*Iₐᴳ;
	E₀ᵢₙ = U₀ᵢₙ
	Uᵢₙ = E₀ᵢₙ .- Rₐ*Iₐᵢₙ
end;

# ╔═╡ 57693454-2ec0-43ff-a6ca-b7c10b92d121
begin
	# Shunt generator load characteristic
	Iₐₛₕ = 0:0.1:8*Iₐᴳ 			# Armature current range
	
	j = 0.0001
	Ifₛₕ = 0:j:maximum(i) 		# Field current range
	E₀ₛₕᵐᵃᵍ = E_i.(Ifₛₕ)  		# Interpolation of FEM to a field current value
	
	Ifₛₕ₀ = i_E(U₀ₛₕ) 			# Interpolation of field current to U₀ value
	Rfₛₕ = U₀ₛₕ / Ifₛₕ₀ 

	ΔUₜₛₕᶠ = E₀ₛₕᵐᵃᵍ - Rfₛₕ * Ifₛₕ 		#ΔUₜ(Id) = E₀(Id) - Rexc * Id
	
	ΔUₜₛₕᶠ = ΔUₜₛₕᶠ[ΔUₜₛₕᶠ .>= 0] 		# selection of positive values of ΔUₜ(Id)

	# interpolation of I (load values) at ΔUₜ(I) curve, for the achieved ΔUₜ(Id) values
	Ishunt = Spline1D(Rₐ*Iₐₛₕ, Iₐₛₕ)
	I_shunt = Ishunt(ΔUₜₛₕᶠ)
	
	ii = count(i->(i>= 0), ΔUₜₛₕᶠ)
	if_ii = 0:j:((ii-1)*j)
	Uₛₕ = Rfₛₕ*if_ii
	
	#check output results:
	I_shunt, Uₛₕ
end;

# ╔═╡ 80ccbb97-53d2-42fb-8c83-f8502149698c
begin
	#= 
	Cumulative compound generator load characteristic:
	- a long shunt circuit was chosen;
	- with extra rheostat for series flux adjust -> simplified with Is=Ia/3 (series inductor is to strong...)
	=#
	Iₐᶜᵒᵐᵖ = 0:1:2*Iₐᴳ
	c=length(Iₐᶜᵒᵐᵖ)
	l=length(Ifₛₕ)
	
	If₀ = i_E(U₀ᶜᵒᵐᵖ) 				# no-load field current
	Rfₛₕᶜᵒᵐᵖ = U₀ᶜᵒᵐᵖ / If₀ 		# total field resistance
	
	ΔUᶠ = (Rₐ + Rₛ/3) * Iₐᶜᵒᵐᵖ 		# armature voltage drop
 	Ifʼ = α * Iₐᶜᵒᵐᵖ/3      		# series current seeing by Nf inductor

	# Parallel compound generator field lines in a type of: matrix[l,c]
	Uᶠ = Rfₛₕᶜᵒᵐᵖ.*(Ifₛₕ[1:l].-Ifʼ[1:c]').+ ΔUᶠ[1:c]'
	
	# Prepare interseption between FEM and parallel compound generator field lines
	func = abs.(E₀ₛₕᵐᵃᵍ.-Uᶠ) 	
	
	zeros_func=findmin(func, dims=1)		# find interseptions
	cartesian=getindex(zeros_func, 2)		# get data
	index=getindex.(cartesian, (2, 1))		# separate data
	indexf=index[2,:] 						# get field current index of interseptions

	Iexₜ=indexf*j 				# field current representing total magnetic flux
	Ifₗ=Iexₜ-Ifʼ 				# field current values at different loads
	Uᶜᵒᵐᵖ=Rfₛₕᶜᵒᵐᵖ*Ifₗ          # load voltages
	
	#check results:
	U₀ᶜᵒᵐᵖ, If₀, Rfₛₕᶜᵒᵐᵖ, Uᶠ
	#Iₐᶜᵒᵐᵖ, Uᶜᵒᵐᵖ, (c, l), Uᶠ, indexx, indexf, Iexₜ, Ifₗ
end;

# ╔═╡ 5c87ea9f-d46f-46a2-8e7e-52eed1f273ea
begin
	plot([In], seriestype=:vline, linestyle=:dash, lc=:red, label=:none, xlabel="I (A)")
	plot!([Un], seriestype=:hline, linestyle=:dash, lc=:red, label="(In, Un) rated values", ylabel="U (V)")
	
	plot!(Iₐᵢₙ, Uᵢₙ, lc=:blue, lw=2, label="Independent",  
			xlims=(0,2*Iₐᴳ), ylims=(0,300))

	plot!(I_shunt, Uₛₕ, lc=:green, lw=2, label="Shunt")

	plot!(Iₐᶜᵒᵐᵖ, Uᶜᵒᵐᵖ, lc=:black, lw=2, label="Compound⁺")
end

# ╔═╡ 57f9654d-4d98-4429-9661-cb6e52b58b4e


# ╔═╡ 3d7cfce7-f135-4211-b34a-db348034d062
begin
	if z==false
		md"""
		## d) Tipo de enrolamento induzido para correntes elevadas
		"""
	else
		md"""
		## d) Armature winding type for high currents
		"""
	end
end

# ╔═╡ 616c9118-1e07-41d0-919a-9ad289c546a6
begin
	if z==false
		md"""
		**Que tipo de enrolamento é selecionado para o induzido, quando se pretende que a máquina de corrente contínua suporte corrente elevadas? Justifique;**
		"""
	else
		md"""
		**What type of winding is selected for the armature, when the direct current machine is intended to withstand high currents? Justify;**
		"""
	end
end

# ╔═╡ de9086cc-4e8e-4fcc-973c-1aaa92cba3f4
begin
	if z==false
		md"""
		O enrolamento induzido do tipo **imbricado** permite obter vários caminhos em paralelo (igual ao número de polos), nos quais a corrente se divide, permitindo assim suportar correntes elevadas, contudo a tensão resultante é baixa.

		> Bibliografia diversa para leitura sobre os enrolamentos do induzido imbricado/ondulado:
		>- Secção 5.3 de [^Guru2001];
		>- Secção 4.2.3 de [^Sen1989];
		>- Secção 6-3 de [^Matsch1987];
		>- Secção 8.3 de [^Chapman2005];
		>- Secção 4.2-10 de [^Sahdev2018].
		"""
	else
		md"""
		The **lap** armature winding type allows to obtain several parallel paths  (equal to the poles number), in which the current is divided, thus allowing it to withstand high currents, however the resulting voltage is low.

		> Diverse bibliography for reading on lap/wave armature windings:
		>- Section 5.3 of [^Guru2001];
		>- Section 4.2.3 of [^Sen1989];
		>- Section 6-3 of [^Matsch1987];
		>- Section 8.3 of [^Chapman2005];
		>- Section 4.2-10 of [^Sahdev2018].
		"""
	end
end

# ╔═╡ 17f36e28-24b9-40fa-86fa-d896f035eaae


# ╔═╡ 1f863b7f-b47a-49a9-b524-5d4af55a6c11
begin
	if z==false
		md"""
		## e) Comutação/polos auxiliares
		"""
	else
		md"""
		## e) Commutation/auxiliary poles
		"""
	end
end

# ╔═╡ 649c95ce-6b90-4646-adbe-3aa0a106214e
begin
	if z==false
		md"""
		**O que são, onde são colocados e como atuam os polos auxiliares de uma máquina de corrente contínua? Como estão identificados na placa de terminais da máquina?**
		"""
	else
		md"""
		**What are and where the auxiliary poles of a direct current machine are  placed? How do they work? How are they identified on the machine's terminal board?**
		"""
	end
end

# ╔═╡ bb96846e-253b-4ce7-8dc8-ea0f7e03dfc9
begin
	if z==false
		md"""
		Os polos auxiliares, também designados por polos de comutação ou ainda por interpolos, tratam-se de pequenas peças polares com enrolamento auxiliar (ligado em série com o enrolamento induzido), que utiliza a corrente do induzido e servem para facilitar o processo de comutação, anulando a reação magnética do induzido, na zona da linha neutra geométrica. 
		
		Na placa de terminais da máquina, os interpolos estão identificados pelo par de terminais: $$\rm G-H$$.

		> Bibliografia diversa para leitura sobre reação magnética do induzido e métodos de mitigação:
		>- Secção 5.8 de [^Guru2001];
		>- Secção 4.3.5 de [^Sen1989];
		>- Secção 6-5.1 de [^Matsch1987];
		>- Secção 8.4 de [^Chapman2005];
		>- Secção 4.24 de [^Sahdev2018].
		"""
	else
		md"""
		Auxiliary poles, also called commutating poles or interpoles, are small pole pieces with an auxiliary winding (connected in series with the armature winding), which uses the armature current and serve to facilitate the commutation process, cancel the armature reaction, around to the geometric neutral line.

		On the machine terminal board, the interpoles are identified by the terminal pair: $$\rm G-H$$.

		> Diverse bibliography for reading about the armature reaction and its mitigation methods:
		>- Section 5.8 of [^Guru2001];
		>- Section 4.3.5 of [^Sen1989];
		>- Section 6-5.1 of [^Matsch1987];
		>- Section 8.4 of [^Chapman2005];
		>- Section 4.24 of [^Sahdev2018].
		"""
	end
end

# ╔═╡ ac29873b-755d-416a-8276-2e1ac5bb446a


# ╔═╡ ac1bc909-c6b0-497a-9c63-c1fccf7afa5c
md"""
# II - Motor
"""

# ╔═╡ 9312748a-e976-4e10-8492-84edee70d785
begin
	if z==false
		md"""
		## a) motor de excitação composta, $n$
		"""
	else
		md"""
		## a) Compound motor, $n$
		"""
	end
end

# ╔═╡ e786c743-2c26-4c8b-a271-3d23b6cfdebc
begin
	if z==false
		md"""
		**Determine a velocidade nas condições indicadas no esquema elétrico do motor;**
		"""
	else
		md"""
		**Determine the speed under the conditions indicated on the motor electric scheme;**
		"""
	end
end

# ╔═╡ bb1a1a49-fe8d-4d8a-aa84-2dc80d5af0a5
begin
	if z==false
		md"""
		O circuito de excitação derivação do motor DC apresenta os valores do reóstato de campo, $$R_{rh}^M$$ e do enrolamento de excitação, $$R_f$$, pelo que se pode determinar a corrente de excitação deste ramo, $$I_f^M$$:

		$$I_f^M=\frac{U^M}{R_f+R_{rh}^M}$$
		"""
	else
		md"""
		The shunt excitation circuit of the DC motor presents the values of the field rheostat and the field winding, thus the field current of this branch can be achived:

		$$I_f^M=\frac{U^M}{R_f+R_{rh}^M}$$
		"""
	end
end

# ╔═╡ 36694975-3d03-4cc3-a50e-4fb7cfc9695f
Ifᴹ = Uᴹ /(Rf + Rᵣₕᴹ)  			# A, DC motor shunt field current

# ╔═╡ 9105e60e-dd05-4ccd-8c7c-31768b41bf24
begin
	if z==false
		md"""
		O motor DC encontra-se ligado com excitação composta, em longa derivação, com fluxo série aditivo. Assim, para o cálculo do fluxo magnético total é necessário contabilizar também o contributo do enrolamento de excitação série. A corrente de excitação $$I_{ex}$$ representa a força magnetomotriz total dos polos de excitação e vem dada por:

		$$I_{ex}^M=I_f^M + \alpha I_a^M$$ onde:
		
		$$\alpha=\frac{N_s}{N_f}$$
		"""
	else
		md"""
		The DC motor is connected with compound excitation, in long shunt, with cumulative/additive series flux. Thus, to calculate the total magnetic flux, it is also necessary to taking account, the contribution of the series excitation winding. The field current $$I_{ex}$$ represents the total magnetomotive force of the field poles and is given by:

		$$I_{ex}^M=I_f^M + \alpha I_a^M$$ 
		
		with:
		
		$$\alpha=\frac{N_s}{N_f}$$
		"""
	end
end

# ╔═╡ 3a3138c4-380d-4f73-9872-cfa311972618
Iexᴹ = Ifᴹ + α * Iₐᴹ 		# A, DC motor total field current

# ╔═╡ 3bad44ae-3fef-4fee-bac8-3991155cdc86
begin
	if z==false
		md"""
		O valor da corrente de excitação calculado, $$I_{ex}^M$$, é agora utilizado para verificar qual a FEM correspondente na característica magnética e assim determinar-se o valor do fluxo magnético, representado por $$k\phi_0^M$$:
		"""
	else
		md"""
		The value of the calculated field current, $$I_{ex}^M$$, is now used to verify the corresponding EMF in the magnetic characteristic and thus to determine the value of the magnetic flux, represented by $$k\phi_0^ M$$:
		"""
	end
end

# ╔═╡ 00b51733-1a4b-4c2b-8cf9-52dae8cd0026
begin
	E₀ᵐᵃᵍᴹ = E_i(Iexᴹ)			# V, EMF from magnetic characteristic
	kϕ₀ᴹ = E₀ᵐᵃᵍᴹ / n_mag  		# V/rpm, related magnetic flux
	E₀ᵐᵃᵍᴹ, kϕ₀ᴹ
end

# ╔═╡ a3066a61-48e9-489e-8876-b4917dc5b9c9
begin
	if z==false
		md"""
		Assim, têm-se os dados para determinar a velocidade do motor DC através da expressão genérica:

		$$n=\frac{U-(R_a+R_s)I_a+\Delta E}{k\phi_0}$$
		"""
	else
		md"""
		Thus, we have the data to determine the DC motor speed through the generic expression:

		$$n=\frac{U-(R_a+R_s)I_a+\Delta E}{k\phi_0}$$
		"""
	end
end

# ╔═╡ ba4f74cb-0aed-46b6-b997-245cda624df9
begin
	nᴹ = (Uᴹ - (Rₐ+Rₛ)*Iₐᴹ + ΔE)/kϕ₀ᴹ   		# rpm, DC motor speed
	nᴹ = round(Int, nᴹ) 						# rpm, speed rounded to unit
end

# ╔═╡ 8e446ce3-f1d5-433e-a9be-71d5c430e824


# ╔═╡ d18d3643-1785-42fd-a0e0-0f7d147b1a61
begin
	if z==false
		md"""
		## b) Motor série, $I$
		"""
	else
		md"""
		## b) Series motor, $I$
		"""
	end
end

# ╔═╡ bdeaa35b-0ce1-465e-a5bd-d0e7e717e135
begin
	if z==false
		md"""
		**Considere que desliga no circuito do motor, o ramo de excitação em derivação.**

		**Determine a corrente consumida quando o motor série fornece uma potência útil de 27.5kW (binário motor e velocidade são desconhecidos). Despreze a reação magnética do induzido;**
		"""
	else
		md"""
		**Consider that the shunt field branch is turned off in the motor circuit.**

		**Determine the current consumed when the series motor supplies a mechanical power of 27.5kW (motor torque and speed are unknown). Neglect the armature magnetic reaction**
		"""
	end
end

# ╔═╡ ccaee162-7027-4787-98a2-3515cbdee0ff
Pᵤᴹˢ = 27.5e3

# ╔═╡ 2bb73740-feb1-434c-8fc1-aeb269fa39d0
begin
	if z==false
		md"""
		A potência desenvolvida d e um motor DC é dada por:
		
		$$P_d=P_u+P_{rot}$$
		"""
	else
		md"""
		The developed power of a DC motor is given by:

		$$P_d=P_u+P_{rot}$$
		"""
	end
end

# ╔═╡ def42fc9-c9df-4abe-9494-0353bf08d643
Pdᴹˢ = Pᵤᴹˢ + pᵣₒₜ

# ╔═╡ 6ca44365-eed7-42da-a2cf-c8544e7b1a9f
begin
	if z==false
		md"""
		Por outro lado, a potência desenvolvida e um motor DC é dada por:
		
		$$P_d=E' I_a$$

		No caso do motor série, a força contraeletromotriz (FCEM) vem dada por:
		
		$$E'=U-(R_a+R_s)I$$

		Juntando as duas expressões tém-se:

		$$P_d=U I - (R_a+R_s)I^2$$ com $$I_a=I$$, tratando-se de um motor série.

		Encontrando a raíz apropriada do polinómio anterior, obtém-se a corrente:
		"""
	else
		md"""
		On the other hand, the developed power of a DC motor is given by:

		$$P_d=E' I_a$$

		In the case of the series motor, the  back electromotive force (back-EMF) is given by:

		$$E'=U-(R_a+R_s)I$$

		Combining the two expressions, we have:

		$$P_d=U I - (R_a+R_s)I^2$$ with $$I_a=I$$, in the case of a series motor.

		Finding the appropriate root of the previous polynomial, we obtain the current:
		"""
	end
end

# ╔═╡ 0bed098b-367e-4476-a3f4-d4ccf4cda029
begin
	f(Iₛ) = (Uᴹ - (Rₐ+Rₛ)*Iₛ)*Iₛ - Pdᴹˢ  		# f(Iₛ): polynomial function
	
	# find_zero,  function of Roots.jl package to find  f(x)=0:
	Iₛᴹˢ = find_zero(f, [0, 10*Iₐᴹ])
	Iₛᴹˢ = round(Iₛᴹˢ, digits=1)
end

# ╔═╡ 0cf3f838-1c91-4ee2-8967-ec804bc41e8c


# ╔═╡ 4b360926-b2c4-4efd-89ca-d02fa170a37e
begin
	if z==false
		md"""
		## c) Motor série, $T_d$
		"""
	else
		md"""
		## c) Series motor, $T_d$
		"""
	end
end

# ╔═╡ acbb3a77-8858-4aa8-b6bb-477246c24fa7
begin
	if z==false
		md"""
		**Calcule o binário desenvolvido nas condições da alínea anterior;**
		"""
	else
		md"""
		**Calculate the developed torque, under the conditions of the previous question;**
		"""
	end
end

# ╔═╡ 5aedf07a-4cba-4416-8b0f-29aad1c4a563
begin
	if z==false
		md"""
		O binário desenvolvido, $$T_d$$, depende do fluxo magnético e da corrente do induzido. No caso do motor série a corrente do induzido é também a corrente de excitação, se não for considerado um reóstato de campo.
		
		Como a característica magnética é baseada na corrente de campo do enrolamento $$\rm C-D$$, como se percebe pelos baixos valores da corrente de excitação, é necessário através da razão de equivalência, $$\alpha$$, representar a mesma força magnetomotriz produzida pelo enrolamento $$\rm E-F$$:

		$$I_{ex}^{MS}=I_f^M + \alpha I_a^{MS}$$
		"""
	else
		md"""
		The developed torque, $$T_d$$, depends on the magnetic flux and the armature current. In the case of a series motor, the armature current is also the field current, if a field rheostat is not considered.

		As the magnetic characteristic is based on the $$\rm C-D$$ winding field current, as can be seen from the low excitation current values, it is necessary through the equivalence ratio, $$\alpha$$, to represent the same magnetomotive force  produced by the $$\rm E-F$$ winding:

		$$I_{ex}^{MS}=\alpha I_a^{MS}$$ 
		"""
	end
end

# ╔═╡ b25e57bb-4569-4ef8-a2a2-ca056e008a94
begin
	Iexᴹˢ = α * Iₛᴹˢ  				# A, field current related to C-D field winding
	Iexᴹˢ = round(Iexᴹˢ, digits=3)
end

# ╔═╡ 86a2e35e-566f-4c78-949c-5c8102965133
begin
	if z==false
		md"""
		Com a corrente de excitação, $$I_{ex}^{MS}$$, obtêm-se a FEM e o valor relativo ao fluxo magnético, $$k\phi_0^{MS}$$:
		"""
	else
		md"""
		With the field current, $$I_{ex}^{MS}$$, the values of EMF and the related magnetic flux, $$k\phi_0^{MS}$$, are obtained:
		"""
	end
end

# ╔═╡ 8045db09-25b9-44a2-ab83-ca08a96cf1c8
begin
	E₀ᵐᵃᵍᴹˢ = E_i(Iexᴹˢ)			# V, EMF from magnetic characteristic
	kϕ₀ᴹˢ = E₀ᵐᵃᵍᴹˢ / n_mag 		# V/rpm, related magnetic flux
	E₀ᵐᵃᵍᴹˢ, kϕ₀ᴹˢ
end

# ╔═╡ 02a29e79-9067-4d0b-b9fd-7f1e43cb4045
begin
	Td = kϕ₀ᴹˢ * (60/2π) * Iₛᴹˢ 		# Nm, developed torque
	Td = round(Int, Td)
end;

# ╔═╡ 44effeaa-2765-4249-9f70-dd2036d4c9a2
begin
	if z==false
		md"""
		Assim, obtém-se um binário desenvolvido, $$T_d=$$ $Td $$\rm Nm$$.
		"""
	else
		md"""
		Thus, a developed torque, $$T_d=$$ $Td $$\rm Nm$$ is obtained.
		"""
	end
end

# ╔═╡ 8bdc891f-07d7-4c9a-93c6-93f774f4ce4c


# ╔═╡ f204f664-f4f0-418b-a798-898ab22ac4d9
begin
	if z==false
		md"""
		## d) Embalamento
		"""
	else
		md"""
		## d) Overspeed
		"""
	end
end

# ╔═╡ 7469aeed-9f3a-4833-a4c5-4c71a0395fe8
begin
	if z==false
		md"""
		**Em que situações pode um motor de corrente contínua embalar?**

		**Justifique e apresente duas situações concretas;**
		"""
	else
		md"""
		**In what situations can a DC motor overspeed?**

		**Justify and present two specific situations.**
		"""
	end
end

# ╔═╡ df15da50-053b-47f9-8c61-57d6b0c267cc
begin
	if z==false
		md"""
		Como regra geral, um motor de corrente contínua pode embalar sempre que o fluxo magnético se torne muito reduzido, pois a velocidade é inversamente proporcional ao valor do fluxo magnético.
		
		Situações em que o embalamento do motor pode ocorrer:
		- um motor série ficar em vazio, ou com carga muito reduzida;
		- um motor de excitação composta de fluxo subtrativo com carga excessiva;
		- perda acidental do circuito de excitação nos motores de excitação: independente, derivação e composta (quando em vazio).
		"""
	else
		md"""
		As a rule of thumb, a direct current motor may  overspeed whenever the magnetic flux becomes too low, as the speed is inversely proportional to the value of the magnetic flux.

		Situations in which a motor overspeed can occur:
		- a series motor loose the load, or went to a very low load;
		- a differential compound motor with excessive load;
		- accidental loss of the field circuit in the motors: independent, shunt and compound (when at no-load).
		"""
	end
end

# ╔═╡ fdab8c81-ab77-4db1-b1d4-922a6283c244


# ╔═╡ 8b956ee7-4c85-4b6b-ad08-d086224dcd8c
md"""
## e) 💻 $$R_{fsx}  \updownarrow \:\:\: \Rightarrow \:\: T_d=f(I)$$
"""

# ╔═╡ 16cbb122-d4fe-4fea-8799-20aef78b5a2f
begin
	if z==false
		md"""
		**Apresente qualitativamente a característica de binário desenvolvido de um motor série.**

		**Justifique a sua forma e explicite, também qualitativamente, a influência de um reóstato de campo sobre essa característica**
		"""
	else
		md"""
		**Qualitatively, present the developed torque characteristic of a series motor.**

		**Justify its shape and explain, also qualitatively, the influence of a field rheostat on this characteristic.**
		"""
	end
end

# ╔═╡ f85a8b72-2f94-4692-a763-98b9457837f5
begin
	if z==false
		md"""
		> Para a resolução desta questão optou-se pelo desenvolvimento de uma solução quantitativa, determinando computacionalmente a solução numérica da característica de binário, tirando partido da linguagem de programação científica `Julia` e do ambiente interativo do *notebook* `Pluto.jl`.
		"""
	else
		md"""
		> To solve this question, a quantitative solution was developed, computationally determining the numerical solution of torque characteristic, taking advantage of the scientific programming language `Julia` and the interactive *notebook* environment `Pluto.jl`.
		"""
	end
end

# ╔═╡ ef49d52d-83a2-4f5e-8b84-efd15e94f935
md"""
Field rheostat of series motor, Ω: $(@bind Rfₛₓ PlutoUI.Slider(0.0001:0.0001:0.026, default=0.026, show_value=true))
"""

# ╔═╡ 2b61faee-5b76-43b4-ae84-2da98b8c735e
begin
	if z==false
		md"""
		!!! nota
			Neste exercício interativo, o estudante deverá conseguir justificar a influência de um reóstato de campo sobre essa característica de binário de um motor série. 
		"""
	else
		md"""
		!!! note
			In this interactive exercise, the student should be able to justify the influence of a field rheostat on the torque characteristic of a series motor. 
		"""
	end
end

# ╔═╡ b7f80612-1ee1-435e-9665-4c19158e2638
begin
	if z==false
		md"""
		### Cálculos auxiliares
		Nos 2 blocos de código `Julia` seguintes são efetuados os cálculos de engenharia para determinação da característica de binário do motor série, considerando a influência de um reóstato de excitação ligado em paralelo com o enrolamento de campo.
		"""
	else
		md"""
		### Auxiliary calculations
		In the next 2 `Julia` code snippets, the engineering calculations are carried out to determine the torque characteristic of the series motor, considering the influence of a field rheostat connected in parallel with the field winding.
		"""
	end
end

# ╔═╡ e5e7d63b-67a0-48df-b959-34b0ac7f37c6
begin
	I=0:1:1.5*Iₐᴹ 				# A, current range of series motor
	Ifs= I.* Rfₛₓ / (Rₛ+Rfₛₓ)	# A, field current values
	Iexₛₓᴹˢ= α .* Ifs 			# A, related field currents on magnetic characteristic
	E₀ᵐᵃᵍˢˣ = E_i.(Iexₛₓᴹˢ)		# V, EMF
	kϕ₀ₛₓᴹˢ = E₀ᵐᵃᵍˢˣ / n_mag 	# V/rpm, related magnetic flux
end;

# ╔═╡ 6acc88e7-31ff-48f6-9fb9-67201bcef3a7
Tdᴹˢ = kϕ₀ₛₓᴹˢ .* (60/2π) .* I; 		# Nm, developed torque values

# ╔═╡ d6e80de4-985a-4d43-8f3c-1fd0ea8f6274
plot(I, Tdᴹˢ, 
		xlims=(0,1.5*Iₐᴹ), ylims=(0,400), 
		title="Torque characteristic", label=false,
		ylabel="Developed torque, Nm", xlabel="Armature current, A")

# ╔═╡ 7af2b085-c36c-4469-b852-15b04396e95a
begin
	if z==false
		md"""
		---
		# Bibliografia
		"""
	else
		md"""
		---
		# Bibliography
		"""
	end
end

# ╔═╡ 1c125ce3-4345-4b5d-bf7b-c580b09f5613
md"""
[^Guru2001]: B. S. Guru, H. R. Hiziroğlu, Electric Machinery and Transformers, Oxford University Press, 2001.

[^Sen1989]: P. C. Sen, Principles of electric machines and power electronics, John Wiley & Sons, 1989.

[^Matsch1987]: L. W. Matsch, J. D. Morgan, Electromagnetic and Electromechanical Machines, John Wiley & Sons, 1987.

[^Chapman2005]: S. J. Chapman, Electric Machinery Fundamentals, McGraw Hill, 2005.

[^Sahdev2018]: S. K. Sahdev, Electrical Machines, Cambridge University Press, 2018.
"""

# ╔═╡ 0e383a89-f6c9-4871-9745-1bd7f72fb756
md"""
---
`ISEL/DEEEA/GDME/Máquinas Elétricas 2`
"""


# ╔═╡ 080a827e-c525-4fb3-a81e-b1758949e18e


# ╔═╡ 08a6b27b-8aa2-4225-8f9b-576d8333c3d2
md"""
# *Notebook*
"""

# ╔═╡ 3c84a0d4-8eeb-4feb-8276-4d62ed7492f5
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

# ╔═╡ ea4b7a97-89da-478c-916d-5a497f03c120
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

# ╔═╡ 205b547e-731d-4049-9120-0400a84b2ea0
if z==false
	TableOfContents(title="Índice")
else
	TableOfContents()
end

# ╔═╡ 6cb89985-911f-42ae-8e31-0be655ff37bd
begin
	# other stuff:
	isel_logo="https://www.isel.pt/sites/default/files/NoPath%20-%20Copy%402x_0.png"
	julia_logo="https://github.com/JuliaLang/julia-logo-graphics/blob/master/images/julia-logo-color.png?raw=true"
	version=VERSION
end;

# ╔═╡ 3a2663dc-9474-44b1-b9f8-13cae96c42bf
begin
	if z==false
		md"""
		*Notebook* realizado em linguagem de programação científica `Julia`, versão $(version).

		**_Time to first plot_**: até cerca de 1.4 min.

		**Computador**: Intel® Core™ i5-6300U CPU @ 2.40GHz; 20GB RAM.
		"""
	else
		md"""
		Notebook made in `Julia` scientific programming language, version $(version).

		**Time to first plot**: up to 1.4 min.

		**Computer**: Intel® Core™ i5-6300U CPU @ 2.40GHz; 20GB RAM.
		"""
	end
end

# ╔═╡ d4dabd1a-b852-48e5-89cc-fbcfc299c718
md"""
---
"""

# ╔═╡ 5097c324-3b23-4428-bc5f-26e32fef4aad
ThreeColumn(md"Text content: [![](https://i.creativecommons.org/l/by-sa/4.0/80x15.png)](http://creativecommons.org/licenses/by-sa/4.0/)", md" $(Resource(julia_logo, :height => 15)) `code`: [`MIT License`](https://www.tldrlegal.com/l/mit)", md"[$$© \text{ 2022 Ricardo Luís}$$](https://ricardo-luis.github.io/me2/)")

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Dierckx = "39dd38d3-220a-591b-8e3c-4c3a8c710a94"
EasyFit = "fde71243-0cda-4261-b7c7-4845bd106b21"
Plots = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
PlutoTeachingTools = "661c6b06-c737-4d37-b85c-46df65de6f69"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
Roots = "f2b01f46-fcfa-551c-844a-d8ac1e96c665"

[compat]
Dierckx = "~0.5.2"
EasyFit = "~0.5.7"
Plots = "~1.35.5"
PlutoTeachingTools = "~0.2.3"
PlutoUI = "~0.7.48"
Roots = "~2.0.8"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.0"
manifest_format = "2.0"
project_hash = "468df0dabb5fa702b56a319b94810c35df6caa62"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[deps.Adapt]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "195c5505521008abea5aee4f96930717958eac6f"
uuid = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
version = "3.4.0"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.ArrayInterfaceCore]]
deps = ["LinearAlgebra", "SparseArrays", "SuiteSparse"]
git-tree-sha1 = "e6cba4aadba7e8a7574ab2ba2fcfb307b4c4b02a"
uuid = "30b0a656-2188-435a-8636-2ec0e6a096e2"
version = "0.1.23"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.AxisAlgorithms]]
deps = ["LinearAlgebra", "Random", "SparseArrays", "WoodburyMatrices"]
git-tree-sha1 = "66771c8d21c8ff5e3a93379480a2307ac36863f7"
uuid = "13072b0f-2c55-5437-9ae7-d433b7a33950"
version = "1.0.1"

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

[[deps.Calculus]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "f641eb0a4f00c343bbc32346e1217b86f3ce9dad"
uuid = "49dc2e85-a5d0-5ad3-a950-438e2897f1b9"
version = "0.5.1"

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
git-tree-sha1 = "cc4bd91eba9cdbbb4df4746124c22c0832a460d6"
uuid = "da1fd8a2-8d9e-5ec2-8556-3022fb5608a2"
version = "1.1.1"

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
git-tree-sha1 = "3ca828fe1b75fa84b021a7860bd039eaea84d2f2"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.3.0"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "0.5.2+0"

[[deps.ConstructionBase]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "fb21ddd70a051d882a1686a5a550990bbe371a95"
uuid = "187b0558-2788-49d3-abe0-74a17ed4e7c9"
version = "1.4.1"

[[deps.Contour]]
git-tree-sha1 = "d05d9e7b7aedff4e5b51a029dced05cfb6125781"
uuid = "d38c429a-6771-53c6-b99e-75d170b6e991"
version = "0.6.2"

[[deps.DataAPI]]
git-tree-sha1 = "46d2680e618f8abd007bce0c3026cb0c4a8f2032"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.12.0"

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

[[deps.DensityInterface]]
deps = ["InverseFunctions", "Test"]
git-tree-sha1 = "80c3e8639e3353e5d2912fb3a1916b8455e2494b"
uuid = "b429d917-457f-4dbc-8f4c-0cc954292b1d"
version = "0.4.0"

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

[[deps.DiffResults]]
deps = ["StaticArraysCore"]
git-tree-sha1 = "782dd5f4561f5d267313f23853baaaa4c52ea621"
uuid = "163ba53b-c6d8-5494-b064-1a9d43ac40c5"
version = "1.1.0"

[[deps.DiffRules]]
deps = ["IrrationalConstants", "LogExpFunctions", "NaNMath", "Random", "SpecialFunctions"]
git-tree-sha1 = "8b7a4d23e22f5d44883671da70865ca98f2ebf9d"
uuid = "b552c78f-8df3-52c6-915a-8e097449b14b"
version = "1.12.0"

[[deps.Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[deps.Distributions]]
deps = ["ChainRulesCore", "DensityInterface", "FillArrays", "LinearAlgebra", "PDMats", "Printf", "QuadGK", "Random", "SparseArrays", "SpecialFunctions", "Statistics", "StatsBase", "StatsFuns", "Test"]
git-tree-sha1 = "04db820ebcfc1e053bd8cbb8d8bccf0ff3ead3f7"
uuid = "31c24e10-a181-5473-b8eb-7969acd0382f"
version = "0.25.76"

[[deps.DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "c36550cb29cbe373e95b3f40486b9a4148f89ffd"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.9.2"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.DualNumbers]]
deps = ["Calculus", "NaNMath", "SpecialFunctions"]
git-tree-sha1 = "5837a837389fccf076445fce071c8ddaea35a566"
uuid = "fa6b7ba4-c1ee-5f82-b5fc-ecf0adba8f74"
version = "0.6.8"

[[deps.EasyFit]]
deps = ["Interpolations", "LsqFit", "Parameters", "Statistics"]
git-tree-sha1 = "004c656e77eb0bdd075bfec356d1f511e99f5257"
uuid = "fde71243-0cda-4261-b7c7-4845bd106b21"
version = "0.5.7"

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
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "JLLWrappers", "LAME_jll", "Libdl", "Ogg_jll", "OpenSSL_jll", "Opus_jll", "PCRE2_jll", "Pkg", "Zlib_jll", "libaom_jll", "libass_jll", "libfdk_aac_jll", "libvorbis_jll", "x264_jll", "x265_jll"]
git-tree-sha1 = "74faea50c1d007c85837327f6775bea60b5492dd"
uuid = "b22a6f82-2f65-5046-a5b2-351ab43fb4e5"
version = "4.4.2+2"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.FillArrays]]
deps = ["LinearAlgebra", "Random", "SparseArrays", "Statistics"]
git-tree-sha1 = "802bfc139833d2ba893dd9e62ba1767c88d708ae"
uuid = "1a297f60-69ca-5386-bcde-b61e274b549b"
version = "0.13.5"

[[deps.FiniteDiff]]
deps = ["ArrayInterfaceCore", "LinearAlgebra", "Requires", "Setfield", "SparseArrays", "StaticArrays"]
git-tree-sha1 = "5a2cff9b6b77b33b89f3d97a4d367747adce647e"
uuid = "6a86dc24-6348-571c-b903-95158fe2bd41"
version = "2.15.0"

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
git-tree-sha1 = "187198a4ed8ccd7b5d99c41b69c679269ea2b2d4"
uuid = "f6369f11-7733-5829-9624-2563aa707210"
version = "0.10.32"

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

[[deps.Future]]
deps = ["Random"]
uuid = "9fa8497b-333b-5362-9e8d-4d0656e87820"

[[deps.GLFW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libglvnd_jll", "Pkg", "Xorg_libXcursor_jll", "Xorg_libXi_jll", "Xorg_libXinerama_jll", "Xorg_libXrandr_jll"]
git-tree-sha1 = "d972031d28c8c8d9d7b41a536ad7bb0c2579caca"
uuid = "0656b61e-2033-5cc2-a64a-77c0f6c09b89"
version = "3.3.8+0"

[[deps.GR]]
deps = ["Base64", "DelimitedFiles", "GR_jll", "HTTP", "JSON", "Libdl", "LinearAlgebra", "Pkg", "Preferences", "Printf", "Random", "Serialization", "Sockets", "Test", "UUIDs"]
git-tree-sha1 = "00a9d4abadc05b9476e937a5557fcce476b9e547"
uuid = "28b8d3ca-fb5f-59d9-8090-bfdbd6d07a71"
version = "0.69.5"

[[deps.GR_jll]]
deps = ["Artifacts", "Bzip2_jll", "Cairo_jll", "FFMPEG_jll", "Fontconfig_jll", "GLFW_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll", "Pixman_jll", "Pkg", "Qt5Base_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "bc9f7725571ddb4ab2c4bc74fa397c1c5ad08943"
uuid = "d2c73de3-f751-5644-a686-071e5b155ba9"
version = "0.69.1+0"

[[deps.Gettext_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "9b02998aba7bf074d14de89f9d37ca24a1a0b046"
uuid = "78b55507-aeef-58d4-861c-77aaff3498b1"
version = "0.21.0+0"

[[deps.Glib_jll]]
deps = ["Artifacts", "Gettext_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Libiconv_jll", "Libmount_jll", "PCRE2_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "fb83fbe02fe57f2c068013aa94bcdf6760d3a7a7"
uuid = "7746bdde-850d-59dc-9ae8-88ece973131d"
version = "2.74.0+1"

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
git-tree-sha1 = "a97d47758e933cd5fe5ea181d178936a9fc60427"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "1.5.1"

[[deps.HarfBuzz_jll]]
deps = ["Artifacts", "Cairo_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "Graphite2_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg"]
git-tree-sha1 = "129acf094d168394e80ee1dc4bc06ec835e510a3"
uuid = "2e76f6c2-a576-52d4-95c1-20adfe4de566"
version = "2.8.1+1"

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

[[deps.IniFile]]
git-tree-sha1 = "f550e6e32074c939295eb5ea6de31849ac2c9625"
uuid = "83e8ac13-25f8-5344-8a64-a9f2b223428f"
version = "0.5.1"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.Interpolations]]
deps = ["Adapt", "AxisAlgorithms", "ChainRulesCore", "LinearAlgebra", "OffsetArrays", "Random", "Ratios", "Requires", "SharedArrays", "SparseArrays", "StaticArrays", "WoodburyMatrices"]
git-tree-sha1 = "842dd89a6cb75e02e85fdd75c760cdc43f5d6863"
uuid = "a98d9a8b-a2ab-59e6-89dd-64a1c18fca59"
version = "0.14.6"

[[deps.InverseFunctions]]
deps = ["Test"]
git-tree-sha1 = "49510dfcb407e572524ba94aeae2fced1f3feb0f"
uuid = "3587e190-3f89-42d0-90ee-14403ec27112"
version = "0.1.8"

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

[[deps.LsqFit]]
deps = ["Distributions", "ForwardDiff", "LinearAlgebra", "NLSolversBase", "OptimBase", "Random", "StatsBase"]
git-tree-sha1 = "00f475f85c50584b12268675072663dfed5594b2"
uuid = "2fda8390-95c7-5789-9bda-21331edee243"
version = "0.13.0"

[[deps.MIMEs]]
git-tree-sha1 = "65f28ad4b594aebe22157d6fac869786a255b7eb"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "0.1.4"

[[deps.MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "42324d08725e200c23d4dfb549e0d5d89dede2d2"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.10"

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

[[deps.NLSolversBase]]
deps = ["DiffResults", "Distributed", "FiniteDiff", "ForwardDiff"]
git-tree-sha1 = "50310f934e55e5ca3912fb941dec199b49ca9b68"
uuid = "d41bc354-129a-5804-8e4c-c37616107c6c"
version = "7.8.2"

[[deps.NaNMath]]
deps = ["OpenLibm_jll"]
git-tree-sha1 = "a7c3d1da1189a1c2fe843a3bfa04d18d20eb3211"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "1.0.1"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OffsetArrays]]
deps = ["Adapt"]
git-tree-sha1 = "f71d8950b724e9ff6110fc948dff5a329f901d64"
uuid = "6fe1bfb0-de20-5000-8ca7-80f57d26f881"
version = "1.12.8"

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
git-tree-sha1 = "3c3c4a401d267b04942545b1e964a20279587fd7"
uuid = "4d8831e6-92b7-49fb-bdf8-b643e874388c"
version = "1.3.0"

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

[[deps.OptimBase]]
deps = ["NLSolversBase", "Printf", "Reexport"]
git-tree-sha1 = "9cb1fee807b599b5f803809e85c81b582d2009d6"
uuid = "87e2bd06-a317-5318-96d9-3ecbac512eee"
version = "2.0.2"

[[deps.Opus_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "51a08fb14ec28da2ec7a927c4337e4332c2a4720"
uuid = "91d4177d-7536-5919-b921-800302f37372"
version = "1.3.2+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[deps.PCRE2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "efcefdf7-47ab-520b-bdef-62a2eaa19f15"
version = "10.40.0+0"

[[deps.PDMats]]
deps = ["LinearAlgebra", "SparseArrays", "SuiteSparse"]
git-tree-sha1 = "cf494dca75a69712a72b80bc48f59dcf3dea63ec"
uuid = "90014a1f-27ba-587c-ab20-58faa44d9150"
version = "0.11.16"

[[deps.Parameters]]
deps = ["OrderedCollections", "UnPack"]
git-tree-sha1 = "34c0e9ad262e5f7fc75b10a9952ca7692cfc5fbe"
uuid = "d96e819e-fc66-5662-9728-84c9c7592b0a"
version = "0.12.3"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "6c01a9b494f6d2a9fc180a08b182fcb06f0958a0"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.4.2"

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
git-tree-sha1 = "21303256d239f6b484977314674aef4bb1fe4420"
uuid = "995b91a9-d308-5afd-9ec6-746e21dbc043"
version = "1.3.1"

[[deps.Plots]]
deps = ["Base64", "Contour", "Dates", "Downloads", "FFMPEG", "FixedPointNumbers", "GR", "JLFzf", "JSON", "LaTeXStrings", "Latexify", "LinearAlgebra", "Measures", "NaNMath", "Pkg", "PlotThemes", "PlotUtils", "Printf", "REPL", "Random", "RecipesBase", "RecipesPipeline", "Reexport", "RelocatableFolders", "Requires", "Scratch", "Showoff", "SnoopPrecompile", "SparseArrays", "Statistics", "StatsBase", "UUIDs", "UnicodeFun", "Unzip"]
git-tree-sha1 = "0a56829d264eb1bc910cf7c39ac008b5bcb5a0d9"
uuid = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
version = "1.35.5"

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
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "efc140104e6d0ae3e7e30d56c98c4a927154d684"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.48"

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
git-tree-sha1 = "0c03844e2231e12fda4d0086fd7cbe4098ee8dc5"
uuid = "ea2cea3b-5b76-57ae-a6ef-0a8af62496e1"
version = "5.15.3+2"

[[deps.QuadGK]]
deps = ["DataStructures", "LinearAlgebra"]
git-tree-sha1 = "3c009334f45dfd546a16a57960a821a1a023d241"
uuid = "1fd47b50-473d-5c70-9696-f719f8f3bcdc"
version = "2.5.0"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Ratios]]
deps = ["Requires"]
git-tree-sha1 = "dc84268fe0e3335a62e315a3a7cf2afa7178a734"
uuid = "c84ed2f1-dad5-54f0-aa8e-dbefe2724439"
version = "0.4.3"

[[deps.RecipesBase]]
deps = ["SnoopPrecompile"]
git-tree-sha1 = "d12e612bba40d189cead6ff857ddb67bd2e6a387"
uuid = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
version = "1.3.1"

[[deps.RecipesPipeline]]
deps = ["Dates", "NaNMath", "PlotUtils", "RecipesBase", "SnoopPrecompile"]
git-tree-sha1 = "9b1c0c8e9188950e66fc28f40bfe0f8aac311fe0"
uuid = "01d81517-befc-4cb6-b9ec-a95719d0359c"
version = "0.6.7"

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

[[deps.Rmath]]
deps = ["Random", "Rmath_jll"]
git-tree-sha1 = "bf3188feca147ce108c76ad82c2792c57abe7b1f"
uuid = "79098fc4-a85e-5d69-aa6a-4863f24498fa"
version = "0.7.0"

[[deps.Rmath_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "68db32dff12bb6127bac73c209881191bf0efbb7"
uuid = "f50d1b31-88e8-58de-be2c-1cc44531875f"
version = "0.3.0+0"

[[deps.Roots]]
deps = ["ChainRulesCore", "CommonSolve", "Printf", "Setfield"]
git-tree-sha1 = "a3db467ce768343235032a1ca0830fc64158dadf"
uuid = "f2b01f46-fcfa-551c-844a-d8ac1e96c665"
version = "2.0.8"

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

[[deps.Setfield]]
deps = ["ConstructionBase", "Future", "MacroTools", "StaticArraysCore"]
git-tree-sha1 = "e2cc6d8c88613c05e1defb55170bf5ff211fbeac"
uuid = "efcf1570-3423-57d1-acb7-fd33fddbac46"
version = "1.1.1"

[[deps.SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

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

[[deps.StaticArrays]]
deps = ["LinearAlgebra", "Random", "StaticArraysCore", "Statistics"]
git-tree-sha1 = "f86b3a049e5d05227b10e15dbb315c5b90f14988"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.5.9"

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
git-tree-sha1 = "5783b877201a82fc0014cbf381e7e6eb130473a4"
uuid = "4c63d2b9-4356-54db-8cca-17b64c39e42c"
version = "1.0.1"

[[deps.SuiteSparse]]
deps = ["Libdl", "LinearAlgebra", "Serialization", "SparseArrays"]
uuid = "4607b0f0-06f3-5cda-b6b1-a6196a1729e9"

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

[[deps.WoodburyMatrices]]
deps = ["LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "de67fa59e33ad156a590055375a30b23c40299d3"
uuid = "efce3f68-66dc-5838-9240-27a6d6f5f9b6"
version = "0.5.5"

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
# ╟─9b9d7372-f136-499a-a900-e999a2a6784e
# ╟─ea3e2579-177a-477f-97f6-71ebe0f014cd
# ╟─760a3389-1381-4639-b569-cc70bf240dbc
# ╟─2ad32a6c-a6b5-4244-8f34-cd456a70fe6c
# ╟─c9c8b075-855f-4650-b928-2d9b227fa52d
# ╟─7ca9e6c8-5e20-4215-a2eb-97798306a060
# ╟─e57b94bc-184a-4148-b41b-3627dcb0b611
# ╟─1e9ffcd8-aaab-4387-a60e-930deaf1f24a
# ╠═616efd77-a81e-4242-9110-cb73b7953497
# ╟─1ceaa326-46f1-4dba-8288-2d06345ca41d
# ╠═929cbbe0-5167-11ed-22ad-3d923623a1e8
# ╟─b64be4f2-d16c-4d40-8437-4bad945cff01
# ╟─a6ff8b62-6fd0-45ff-8453-2c5b0a630219
# ╠═62df9520-f4b6-41e5-a75f-8ad257ef3529
# ╟─016d56be-2d99-4a20-9908-a4fb7c347af0
# ╟─7d2b527d-da2b-4704-a931-3cc06d5a5215
# ╟─4153a634-6797-449f-8c5b-25355b6a5507
# ╟─fc2bd53a-7d0c-4ca8-adef-ddf7b700954b
# ╟─b2792a51-9371-4406-9224-ba96588827c7
# ╠═54ccccd5-a2ce-42cf-85c5-8640fa0afcb4
# ╟─42335ad4-de0a-4ebd-9c2a-729c4a23cf7d
# ╠═eb2b2d53-f1b3-4798-b2fc-ba42b2914826
# ╟─da08e82c-f364-4102-9648-cf400cea0578
# ╠═a5964481-bfc3-429a-94af-6eac8d7335b2
# ╟─9e81564f-a752-4fcf-8309-aedbf46e3d21
# ╠═e4cba508-69ed-4c0d-b3d8-85cd67b375e0
# ╟─cd05b997-f3ec-4e7f-a590-75fb3f8c5eca
# ╟─99718cff-350e-4614-a9bc-b8995e5c1024
# ╟─c115c741-514d-4237-8c92-c9a7e51dbec0
# ╟─b794ec89-73ba-4543-86db-47b930ba2cd2
# ╠═12461786-f362-4f7b-9f1c-1ea0b6256947
# ╠═39917674-e6ad-405f-bc66-1d37437b4fda
# ╠═a0a91e9b-0816-45ca-b46e-da7206406352
# ╠═93b2bdb6-0c50-459f-8a05-5b9f94276b17
# ╠═9f8bb91a-685f-4f3b-9826-2aa05c7fbe16
# ╟─0cd99825-9f0f-420e-904f-412ca8f88660
# ╠═1fcd9e30-cd4e-4aff-b52d-0d4a84c34d9d
# ╟─6c53cb0f-ed8c-44b8-a989-20f7681c4596
# ╠═765f1a81-ed15-48a2-b2a5-184410410736
# ╟─013705ab-87fc-4cf8-a523-a4dd412a06ff
# ╟─2b3f8456-6b70-4b7f-997c-a7d94db46c6b
# ╟─0a6f6c04-7856-495f-ac62-09c865e60472
# ╟─e0b9823e-1e98-4b87-a96f-c9472806f957
# ╟─e645b64d-c6a3-48b0-8ed0-5525bef418e1
# ╟─acd3ce49-2f6b-42a2-ba90-03c46f539fb7
# ╟─afee0704-03a6-4403-afe0-56b5a4a1df40
# ╟─cd5aeeee-5ab6-4589-a6e7-25fb6115b283
# ╟─5c87ea9f-d46f-46a2-8e7e-52eed1f273ea
# ╟─ffd3f7c6-e424-4d35-b711-b1e78bf565b0
# ╟─2131ec25-bbcc-4fb4-abc7-c4d2aaf149cd
# ╟─65b12308-3fd2-4bc3-802f-f45d59c3dd0a
# ╠═5b9a8efb-8068-44b9-aa6f-3979907e8838
# ╠═57693454-2ec0-43ff-a6ca-b7c10b92d121
# ╠═80ccbb97-53d2-42fb-8c83-f8502149698c
# ╟─57f9654d-4d98-4429-9661-cb6e52b58b4e
# ╟─3d7cfce7-f135-4211-b34a-db348034d062
# ╟─616c9118-1e07-41d0-919a-9ad289c546a6
# ╟─de9086cc-4e8e-4fcc-973c-1aaa92cba3f4
# ╟─17f36e28-24b9-40fa-86fa-d896f035eaae
# ╟─1f863b7f-b47a-49a9-b524-5d4af55a6c11
# ╟─649c95ce-6b90-4646-adbe-3aa0a106214e
# ╟─bb96846e-253b-4ce7-8dc8-ea0f7e03dfc9
# ╟─ac29873b-755d-416a-8276-2e1ac5bb446a
# ╟─ac1bc909-c6b0-497a-9c63-c1fccf7afa5c
# ╟─9312748a-e976-4e10-8492-84edee70d785
# ╟─e786c743-2c26-4c8b-a271-3d23b6cfdebc
# ╟─bb1a1a49-fe8d-4d8a-aa84-2dc80d5af0a5
# ╠═36694975-3d03-4cc3-a50e-4fb7cfc9695f
# ╟─9105e60e-dd05-4ccd-8c7c-31768b41bf24
# ╠═3a3138c4-380d-4f73-9872-cfa311972618
# ╟─3bad44ae-3fef-4fee-bac8-3991155cdc86
# ╠═00b51733-1a4b-4c2b-8cf9-52dae8cd0026
# ╟─a3066a61-48e9-489e-8876-b4917dc5b9c9
# ╠═ba4f74cb-0aed-46b6-b997-245cda624df9
# ╟─8e446ce3-f1d5-433e-a9be-71d5c430e824
# ╟─d18d3643-1785-42fd-a0e0-0f7d147b1a61
# ╟─bdeaa35b-0ce1-465e-a5bd-d0e7e717e135
# ╠═ccaee162-7027-4787-98a2-3515cbdee0ff
# ╟─2bb73740-feb1-434c-8fc1-aeb269fa39d0
# ╠═def42fc9-c9df-4abe-9494-0353bf08d643
# ╟─6ca44365-eed7-42da-a2cf-c8544e7b1a9f
# ╠═0bed098b-367e-4476-a3f4-d4ccf4cda029
# ╟─0cf3f838-1c91-4ee2-8967-ec804bc41e8c
# ╟─4b360926-b2c4-4efd-89ca-d02fa170a37e
# ╟─acbb3a77-8858-4aa8-b6bb-477246c24fa7
# ╟─5aedf07a-4cba-4416-8b0f-29aad1c4a563
# ╠═b25e57bb-4569-4ef8-a2a2-ca056e008a94
# ╟─86a2e35e-566f-4c78-949c-5c8102965133
# ╠═8045db09-25b9-44a2-ab83-ca08a96cf1c8
# ╟─44effeaa-2765-4249-9f70-dd2036d4c9a2
# ╠═02a29e79-9067-4d0b-b9fd-7f1e43cb4045
# ╟─8bdc891f-07d7-4c9a-93c6-93f774f4ce4c
# ╟─f204f664-f4f0-418b-a798-898ab22ac4d9
# ╟─7469aeed-9f3a-4833-a4c5-4c71a0395fe8
# ╟─df15da50-053b-47f9-8c61-57d6b0c267cc
# ╟─fdab8c81-ab77-4db1-b1d4-922a6283c244
# ╟─8b956ee7-4c85-4b6b-ad08-d086224dcd8c
# ╟─16cbb122-d4fe-4fea-8799-20aef78b5a2f
# ╟─f85a8b72-2f94-4692-a763-98b9457837f5
# ╟─ef49d52d-83a2-4f5e-8b84-efd15e94f935
# ╟─d6e80de4-985a-4d43-8f3c-1fd0ea8f6274
# ╟─2b61faee-5b76-43b4-ae84-2da98b8c735e
# ╟─b7f80612-1ee1-435e-9665-4c19158e2638
# ╠═e5e7d63b-67a0-48df-b959-34b0ac7f37c6
# ╠═6acc88e7-31ff-48f6-9fb9-67201bcef3a7
# ╟─7af2b085-c36c-4469-b852-15b04396e95a
# ╟─1c125ce3-4345-4b5d-bf7b-c580b09f5613
# ╟─0e383a89-f6c9-4871-9745-1bd7f72fb756
# ╟─080a827e-c525-4fb3-a81e-b1758949e18e
# ╟─08a6b27b-8aa2-4225-8f9b-576d8333c3d2
# ╟─3c84a0d4-8eeb-4feb-8276-4d62ed7492f5
# ╠═1b1df283-8089-41fc-b08f-e0e0d72253d8
# ╟─3a2663dc-9474-44b1-b9f8-13cae96c42bf
# ╟─ea4b7a97-89da-478c-916d-5a497f03c120
# ╟─205b547e-731d-4049-9120-0400a84b2ea0
# ╟─6cb89985-911f-42ae-8e31-0be655ff37bd
# ╟─d4dabd1a-b852-48e5-89cc-fbcfc299c718
# ╟─5097c324-3b23-4428-bc5f-26e32fef4aad
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
