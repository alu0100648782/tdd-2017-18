#pruebas
require "spec_helper"
require 'benchmark'
describe Alimentos do

  context Alimento do
    before :each do
      @alimentos1 = Alimento.new("Huevo frito", 14.1, 0.0, 19.5)
      @alimentos2 = Alimento.new("Leche vaca", 3.3, 4.8, 3.2)
      @alimentos3 = Alimento.new("Yogurt", 3.8, 4.8, 3.8)
      @alimentos4 = Alimento.new("Cerdo", 21.5, 0.0, 6.3)
      @alimentos5 = Alimento.new("Ternera", 21.1, 0.0, 3.1)
      @alimentos6 = Alimento.new("Pollo", 20.6, 0.0, 5.6)
      @alimentos7 = Alimento.new("Bacalao", 17.7, 0.0, 0.4)
      @alimentos8 = Alimento.new("Atún", 21.5, 0.0, 15.5)
      @alimentso9 = Alimento.new("Salmón", 19.9, 0.0, 13.6)
      @alimentos10 = Alimento.new("Aceite de oliva", 0.0, 0.2, 99.6)
      @alimentos11 = Alimento.new("Chocolate", 5.3, 47.0, 30.0)
      @alimentos12 = Alimento.new("Azúcar", 0.0, 99.8, 0.0)
      @alimentos13 = Alimento.new("Arroz", 6.8, 77.7, 0.6)
      @alimentos14 = Alimento.new("Lentejas", 23.5, 52.0, 1.4)
      @alimentos15 = Alimento.new("Papas", 2.0, 15.4, 0.1)
      @alimentos16 = Alimento.new("Tomate", 1.0, 3.5, 0.2)
      @alimentos17 = Alimento.new("Cebolla", 1.3, 5.8, 0.3)
      @alimentos18 = Alimento.new("Manzana", 0.3, 12.4, 0.4)
      @alimentos19 = Alimento.new("Plátanos", 1.2, 21.4, 0.2)
    end

    it "Debe existir un nombre para el alimento" do
       expect(@alimentos1.nombre).to be == "Huevo frito"
    end

    it "Debe existir la cantidad de proteínas del alimento en gramos" do
       expect(@alimentos1.proteinas).to be == 14.1
    end

    it "Debe existir la candidad de glucidos del alimento en gramos." do
       expect(@alimentos1.glucidos).to be == 0.0
    end

    it "Debe existir la candidad de grasas del alimento en gramos" do
       expect(@alimentos1.lipidos).to be == 19.5
    end

    it "Existe un metodo para obtener el nombre del alimento" do
       expect(@alimentos1.get_nombre).to be == "Huevo frito"
    end


    it "Existe un metodo para obtener la cantidad de proteinas del alimento" do
       expect(@alimentos1.get_proteinas).to be == 14.1
    end

    it "Existe un metodo para obtener la cantidad de glucidos de un alimento" do
       expect(@alimentos1.get_glucidos).to be == 0.0
    end

    it "Existe un metodo para obtener la cantidad de grasas de un alimento" do
       expect(@alimentos1.get_lipidos).to be == 19.5
    end

    it "Existe un metodo para obtener el alimento formateado" do
       expect(@alimentos1.to_s).to be == "Huevo frito, 14.1, 0.0, 19.5"
    end

    it "Existe un metodo para obtener el valor energetico de un alimento." do
       expect(@alimentos1.get_energetico).to be == 231.9
    end

  end

  context Grupo do
	before :each do
		@alimentos1 = Alimento.new("Huevo frito", 14.1, 0.0, 19.5)
		@alimentos2 = Alimento.new("Leche vaca", 3.3, 4.8, 3.2)
		@alimentos3 = Alimento.new("Yogurt", 3.8, 4.8, 3.8)
		@migrupo1 = Grupo.new(
		"Huevos, lacteos y helados",
		[ @alimentos1, @alimentos2, @alimentos3 ])
	end

	it 'Prueba Grupo' do
		expect(@migrupo1.to_s).to eq("HUEVOS, LACTEOS Y HELADOS\n-Huevo frito, 14.1, 0.0, 19.5,\n-Leche vaca, 3.3, 4.8, 3.2,\n-Yogurt, 3.8, 4.8, 3.8")
	end

	it 'Prueba de pertenencia a Grupo (Clase Madre)' do
		expect(@migrupo1.is_a? Grupo).to eq true
	end

	it 'Prueba de no pertenencia a Grupo_lacteos' do
		expect(@migrupo1.is_a? Grupo_lacteos).to eq false
	end

	it 'Prueba de no pertenencia a Grupo_carnes' do
		expect(@migrupo1.is_a? Grupo_carnes).to eq false
	end

	it 'La clase del objeto Grupo' do
		expect(@migrupo1.class).to eq(Grupo)
	end
  end

  context Grupo_lacteos do
	before :each do
		@alimentos1 = Alimento.new("Huevo frito", 14.1, 0.0, 19.5)
		@alimentos2 = Alimento.new("Leche vaca", 3.3, 4.8, 3.2)
		@alimentos3 = Alimento.new("Yogurt", 3.8, 4.8, 3.8)
		@migrupo1 = Grupo_lacteos.new(
		"Huevos, lacteos y helados",
		[ @alimentos1, @alimentos2, @alimentos3 ])
	end

	it 'Prueba Grupo_lacteos' do	
		expect(@migrupo1.to_s).to eq("HUEVOS, LACTEOS Y HELADOS\n-Huevo frito, 14.1, 0.0, 19.5,\n-Leche vaca, 3.3, 4.8, 3.2,\n-Yogurt, 3.8, 4.8, 3.8")
	end

	it 'Prueba de pertenencia a Grupo (Clase madre)' do
		expect(@migrupo1.is_a? Grupo).to eq true
	end

	it 'Prueba de no instancia de Grupo (Clase madre)' do
		expect(@migrupo1.instance_of? Grupo).to equal false
	end

	it 'La clase del objeto Grupo_lacteos' do
		expect(@migrupo1.class).to eq(Grupo_lacteos)
	end

	it 'Prueba de pertenencia a la superclase Grupo' do
		expect(@migrupo1.class.superclass).to eq(Grupo)
	end

	it 'Prueba de pertenencia a Grupo_lacteos (Clase hija)' do
		expect(@migrupo1.is_a? Grupo_lacteos).to eq true
	end

	it 'Prueba de pertenencia a Grupo_carnes (Clase hija)' do
		expect(@migrupo1.is_a? Grupo_carnes).to eq false
	end

	it 'Prueba de no pertenencia a Grupo_carnes (clase hija) respond_to' do
		expect(@migrupo1.respond_to? "Menu_carnes").to eq false
	end

  end
#----------------------------------------------------------------------------
  context Grupo_carnes do
        before :each do
                @alimentos4 = Alimento.new("Cerdo", 21.5, 0.0, 6.3)
                @alimentos5 = Alimento.new("Ternera", 21.1, 0.0, 3.1)
                @alimentos6 = Alimento.new("Pollo", 26.6, 0.0, 5.6)
                @migrupo2 = Grupo_carnes.new(
                "Cerdo, Ternera y Pollo",
                [ @alimentos4, @alimentos5, @alimentos6 ])
        end

        it 'Prueba Grupo_carnes' do
                expect(@migrupo2.to_s).to eq("CERDO, TERNERA Y POLLO\n-Cerdo, 21.5, 0.0, 6.3,\n-Ternera, 21.1, 0.0, 3.1,\n-Pollo, 26.6, 0.0, 5.6")
        end

        it 'Prueba de pertenencia a Grupo (Clase madre)' do
                expect(@migrupo2.is_a? Grupo).to eq true
        end

        it 'Prueba de no instancia de Grupo (Clase madre)' do
                expect(@migrupo2.instance_of? Grupo).to equal false
        end

        it 'La clase del objeto Grupo_carnes' do
                expect(@migrupo2.class).to eq(Grupo_carnes)
        end

        it 'Prueba de pertenencia a la superclase Grupo' do
                expect(@migrupo2.class.superclass).to eq(Grupo)
        end

        it 'Prueba de pertenencia a Grupo_carnes (Clase hija)' do
                expect(@migrupo2.is_a? Grupo_carnes).to eq true
        end

        it 'Prueba de pertenencia a Grupo_lacteos (Clase hija)' do
                expect(@migrupo2.is_a? Grupo_lacteos).to eq false
        end

        it 'Prueba de no pertenencia a Grupo_lacteos (clase hija) respond_to' do
                expect(@migrupo2.respond_to? "Menu_lacteos").to eq false
        end

  end


#----------------------------------------------------------------------------
  context Nodo do
	before :each do
		@alimentos1 = Alimento.new("Huevo frito", 14.1, 0.0, 19.5)
		@alimentos2 = Alimento.new("Leche vaca", 3.3, 4.8, 3.2)
		@alimentos3 = Alimento.new("Yogurt", 3.8, 4.8, 3.8)
		@migrupo1 = Grupo_lacteos.new(
		"Huevos, lacteos y helados",
		[ @alimentos1, @alimentos2, @alimentos3 ])

		@nodo1=Nodo.new(@migrupo1,nil,nil)
	end

	it 'Existe valor de nodo' do
	      expect(@nodo1.value).to eq(@migrupo1)
	end

	it 'Siguiente de nodo es nil' do
		expect(@nodo1.next).to equal(nil)
	end
  end
  
  context Lista do
       before :each do			
	       @alimentos1 = Alimento.new("Huevo frito", 14.1, 0.0, 19.5)
               @alimentos2 = Alimento.new("Leche vaca", 3.3, 4.8, 3.2)
	       @alimentos3 = Alimento.new("Yogurt", 3.8, 4.8, 3.8)
	       @alimentos4 = Alimento.new("Cerdo", 21.5, 0.0, 6.3)
	       @alimentos5 = Alimento.new("Ternera", 21.1, 0.0, 3.1)
	       @alimentos6 = Alimento.new("Pollo", 20.6, 0.0, 5.6)
	       @alimentos7 = Alimento.new("Bacalao", 17.7, 0.0, 0.4)
	       @alimentos8 = Alimento.new("Atún", 21.5, 0.0, 15.5)
	       @alimentos9 = Alimento.new("Salmón", 19.9, 0.0, 13.6)
	       @alimentos10 = Alimento.new("Aceite de oliva", 0.0, 0.2, 99.6)
	       @alimentos11 = Alimento.new("Chocolate", 5.3, 47.0, 30.0)
	       @alimentos12 = Alimento.new("Azúcar", 0.0, 99.8, 0.0)
	       @alimentos13 = Alimento.new("Arroz", 6.8, 77.7, 0.6)
	       @alimentos14 = Alimento.new("Lentejas", 23.5, 52.0, 1.4)
	       @alimentos15 = Alimento.new("Papas", 2.0, 15.4, 0.1)
	       @alimentos16 = Alimento.new("Tomate", 1.0, 3.5, 0.2)
	       @alimentos17 = Alimento.new("Cebolla", 1.3, 5.8, 0.3)
	       @alimentos18 = Alimento.new("Manzana", 0.3, 12.4, 0.4)
	       @alimentos19 = Alimento.new("Plátanos", 1.2, 21.4, 0.2)
	       @migrupo1 = Grupo.new(
	       "Huevos, lacteos y helados",
	       [ @alimentos1, @alimentos2, @alimentos3 ])
	       @migrupo2 = Grupo.new(
	       "Cerdo, Ternera y Pollo",
	       [ @alimentos4, @alimentos5, @alimentos6 ])
	       @migrupo3 = Grupo.new(
	       "Pescados y mariscos",
	       [ @alimentos7, @alimentos8, @alimentos9 ])
	       @migrupo4 = Grupo.new(
	       "Alimentos grasos",
	       [ @alimentos10, @alimentos11, @alimentos12 ])
	       @lista1 = Lista.new(nil,nil)
	 end

	 it 'Debe existir una Lista con su cabeza' do
	         @lista1.insertar(@migrupo1)
	      	 expect(@lista1.cabeza.value).to eq(@migrupo1)
	 end

	 it 'Se puede insertar un elemento' do 
        	 @lista1.insertar(@migrupo1)
	         expect(x = @lista1.cabeza.value).to equal(@migrupo1)
  	 end

	 it 'Se pueden insertar varios elementos' do
      		 @lista1.insertar_varios([@migrupo1,@migrupo2,@migrupo3,@migrupo4])
		 expect(x =@lista1.cabeza.value).to equal(@migrupo4)
	 end

	 it 'Se extrae el primer elemento de la lista' do
        	 @lista1.insertar_varios([@migrupo1,@migrupo2,@migrupo3,@migrupo4])
	         @lista1.extraer_inicio()
        	 expect(x =@lista1.cabeza.value).to equal(@migrupo4)
	 end
  end

#--------------------------------------------------------------------------------------------------------------
  context "Prueba lista enumerable" do
         before :each do
                 @alimentos1 = Alimento.new("Huevo frito", 14.1, 0.0, 19.5)
                 @alimentos2 = Alimento.new("Leche vaca", 3.3, 4.8, 3.2)
                 @alimentos3 = Alimento.new("Yogurt", 3.8, 4.8, 3.8)
                 @alimentos4 = Alimento.new("Cerdo", 21.5, 0.0, 6.3)
                 @alimentos5 = Alimento.new("Ternera", 21.1, 0.0, 3.1)
                 @alimentos6 = Alimento.new("Pollo", 20.6, 0.0, 5.6)
                 @alimentos7 = Alimento.new("Bacalao", 17.7, 0.0, 0.4)
                 @alimentos8 = Alimento.new("Atún", 21.5, 0.0, 15.5)
                 @alimentos9 = Alimento.new("Salmón", 19.9, 0.0, 13.6)
                 @alimentos10 = Alimento.new("Aceite de oliva", 0.0, 0.2, 99.6)
                 @alimentos11 = Alimento.new("Chocolate", 5.3, 47.0, 30.0)
                 @alimentos12 = Alimento.new("Azúcar", 0.0, 99.8, 0.0)
                 @alimentos13 = Alimento.new("Arroz", 6.8, 77.7, 0.6)
                 @alimentos14 = Alimento.new("Lentejas", 23.5, 52.0, 1.4)
                 @alimentos15 = Alimento.new("Papas", 2.0, 15.4, 0.1)
                 @alimentos16 = Alimento.new("Tomate", 1.0, 3.5, 0.2)
                 @alimentos17 = Alimento.new("Cebolla", 1.3, 5.8, 0.3)
                 @alimentos18 = Alimento.new("Manzana", 0.3, 12.4, 0.4)
                 @alimentos19 = Alimento.new("Plátanos", 1.2, 21.4, 0.2)
                 @migrupo1 = Grupo.new(
                 "Huevos, lacteos y helados",
                 [ @alimentos1, @alimentos2, @alimentos3 ])
                 @migrupo2 = Grupo.new(
                 "Carnes y derivados",
                 [ @alimentos4, @alimentos5, @alimentos6 ])
                 @migrupo3 = Grupo.new(
                 "Pescados y mariscos",
                 [ @alimentos7, @alimentos8, @alimentos9 ])
                 @migrupo4 = Grupo.new(
                 "Alimentos grasos",
                 [ @alimentos10, @alimentos11, @alimentos12 ])
                 @lista1 = Lista.new(nil,nil)
         end

      it 'Prueba minimo en una inserción con numeros' do
		@lista1.insertar_varios([1,2])
		expect(@lista1.min).to eq(1)
      end

      it 'Prueba minimo en una inserción con Grupos' do
		@lista1.insertar_varios([@migrupo1,@migrupo2])
		expect(@lista1.min).to eq(@migrupo2)
      end

      it 'Prueba maximo en una insercion con numeros' do
		@lista1.insertar_varios([1,2])
		expect(@lista1.max).to eq(2)
      end

      it 'Prueba maximo en una insercion con Grupos' do
		@lista1.insertar_varios([@migrupo1,@migrupo2])
		expect(@lista1.max).to eq(@migrupo1)
      end

      it 'Prueba drop en una insercion con numeros' do
		@lista1.insertar_varios([1,2,3,4,5])
		expect(@lista1.drop(3)).to eq([2,1])
      end

      it 'Prueba drop en una insercion con Grupos' do
		@lista1.insertar_varios([@migrupo1,@migrupo2,@migrupo3,@migrupo4])
		expect(@lista1.drop(2)).to eq([@migrupo2,@migrupo1])
      end

      it 'Prueba ordenacion en una insercion con numeros' do
		@lista1.insertar_varios([1,3,2,4])
		expect(@lista1.sort).to eq([1,2,3,4])
      end

      it 'Prueba ordenacion en una insercion con Grupos' do
           @lista1.insertar_varios([@migrupo2,@migrupo4,@migrupo1,@migrupo3])
           expect(@lista1.sort).to eq([@migrupo4,@migrupo2,@migrupo1,@migrupo3])
      end

      it 'Prueba del metodo all? con Grupos' do
		@lista1.insertar_varios([@migrupo2,@migrupo4,@migrupo1,@migrupo3])
		expect(@lista1.all?).to eq(true)
      end
 
      it 'Prueba del metodo all? con numeros' do
		@lista1.insertar_varios([1,3,2,4])
		expect(@lista1.all?).to eq(true)
      end

      #no puede comprobar que el valor de la struct de nodo no exista porque el valor no es nil
      it 'Prueba del metodo all? con lista vacia' do
		expect(@lista1.all?).to eq(true)
      end

      it 'Prueba del metodo any? con Grupos' do
		@lista1.insertar_varios([@migrupo2,@migrupo4,@migrupo1,@migrupo3])
		expect(@lista1.any?).to eq(true)
      end
 
      it 'Prueba del metodo any? con numeros' do
		@lista1.insertar_varios([1,3,2,4])
		expect(@lista1.any?).to eq(true)
		expect(@lista1.any?{|x|x >=2}).to eq(true)
      end

      it 'Prueba del metodo collect con numeros' do
		@lista1.insertar(3)
		expect(@lista1.map{|i| i*i}).to eq([9])
		expect(@lista1.collect{|i| i*i}).to eq([9])
      end

      it 'Prueba del metodo count con numeros' do
		@lista1.insertar_varios([1,3,2,4,5,7,8])
		expect(@lista1.count).to eq(7)
      end

      it 'Prueba el metodo detect con numero' do
		@lista1.insertar_varios([1,2,3,0,5,7,4])
		expect(@lista1.detect {|i| i == 0}).to eq(0)
		expect(@lista1.find {|i| i == 3}).to eq(3)
		expect(@lista1.find {|i| i % 2 == 0}).to eq(2)
      end

  end


  context 'Menu Comparable' do
	before :each do
		@alimentos1 = Alimento.new("Huevo frito", 14.1, 0.0, 19.5)
		@alimentos2 = Alimento.new("Leche vaca", 3.3, 4.8, 3.2)
		@alimentos3 = Alimento.new("Yogurt", 3.8, 4.8, 3.8)
		@alimentos4 = Alimento.new("Cerdo", 21.5, 0.0, 6.3)
		@alimentos5 = Alimento.new("Ternera", 21.1, 0.0, 3.1)
		@alimentos6 = Alimento.new("Pollo", 20.6, 0.0, 5.6)
		@alimentos7 = Alimento.new("Bacalao", 17.7, 0.0, 0.4)
		@alimentos8 = Alimento.new("Atún", 21.5, 0.0, 15.5)
		@alimentos9 = Alimento.new("Salmón", 19.9, 0.0, 13.6)
		@alimentos10 = Alimento.new("Aceite de oliva", 0.0, 0.2, 99.6)
		@alimentos11 = Alimento.new("Chocolate", 5.3, 47.0, 30.0)
		@alimentos12 = Alimento.new("Azúcar", 0.0, 99.8, 0.0)
		@alimentos13 = Alimento.new("Arroz", 6.8, 77.7, 0.6)
		@alimentos14 = Alimento.new("Lentejas", 23.5, 52.0, 1.4)
		@alimentos15 = Alimento.new("Papas", 2.0, 15.4, 0.1)
		@alimentos16 = Alimento.new("Tomate", 1.0, 3.5, 0.2)
		@alimentos17 = Alimento.new("Cebolla", 1.3, 5.8, 0.3)
		@alimentos18 = Alimento.new("Manzana", 0.3, 12.4, 0.4)
		@alimentos19 = Alimento.new("Plátanos", 1.2, 21.4, 0.2)
	        @grupo = Grupo.new(
		"Huevos, lacteos y helados",
		[ @alimentos1, @alimentos2, @alimentos3 ])
		@grupo_carnes = Grupo_carnes.new(
		"Carnes y derivados",
		[ @alimentos4, @alimentos5, @alimentos6 ])
		@grupo_pescados = Grupo_pescados.new(
		"Pescados y mariscos",
		[ @alimentos7, @alimentos8, @alimentos9 ])
		@grupo_grasos = Grupo_grasos.new(
		"Alimentos grasos",
		[ @alimentos10, @alimentos11, @alimentos12 ])
	end

	 it 'Comparable Grupo carnes menor que Grupo pescados true' do
		expect(@grupo_carnes < @grupo_pescados).to eq(true) 
	 end

	 it 'Comparable con grupo y grupo_pescados grupo menor grupo_pescados true' do
		expect(@grupo < @grupo_pescados).to eq(true) 
	end

	it 'Comparable con grupo grupo mayor grupo_carnes true' do
		expect(@grupo > @grupo_carnes).to eq(true) 
	end

	it 'Comparable con grupo_pescados mayor que grupo true' do
		expect(@grupo_pescados > @grupo).to eq(true) 
	end

	it 'Comparable con grupo grupo igual grupo true' do
		expect(@grupo == @grupo).to eq(true) 
	end

	it 'Comparable grupo_pescados mayor o igual que grupo_carnes true' do
		expect(@grupo_pescados >= @grupo_carnes).to eq(true)
	end

	it 'Comparable grupo menor o igual que grupo_pescados true' do
		expect(@grupo <= @grupo_pescados).to eq(true)
	end
  end  
  

  context 'Comidas' do
	before :each do	
	        @compota1 = Comida.new('Compota', '5',     [6.7,6.5,6.8,6.9,7.0,7.1,6.9,6.9,6.9,6.7,6.9,7.3,7.0,7.0,7.2,7.1,6.8,7.2,7.3,7.0,6.8,6.7,6.8,6.7,6.9])
	        @yogurt1 = Comida.new('Yogurt', '5',       [6.1,6.6,6.3,6.3,6.1,6.9,6.8,6.5,6.4,6.9,6.8,6.5,6.3,6.2,6.7,6.2,5.9,5.8,5.8,5.8,5.8,5.8,5.9,6.2,6.4])
	        @chocolate1 = Comida.new('Chocolate', '5', [6.5,6.5,6.7,6.5,6.5,6.8,6.7,6.2,6.5,7.2,6.9,7.0,6.3,6.2,6.1,5.9,5.8,6.1,6.7,6.7,6.6,6.7,6.9,7.2,7.1])
		@glucosa1 = Comida.new('Glucosa', '5',     [4.9,5.3,5.9,6.7,7.2,7.6,8.0,8.2,8.2,8.4,8.3,8.3,8.0,7.5,7.1,6.8,6.8,6.9,6.8,6.3,6.2,6.3,6.2,6.3,6.1])
		@individuo1 = Individuo.new('1',[@compota1,@yogurt1,@chocolate1],@glucosa1)

	        @compota2 = Comida.new('Compota', '5',    [4.6,4.8,5.3,5.6,6.1,6.5,6.6,7.0,7.0,6.8,6.4,6.3,6.1,6.1,6.2,6.0,6.1,6.1,6.2,6.3,6.4,6.1,6.1,5.7,5.9])
	        @yogurt2 = Comida.new('Yogurt', '5',      [4.9,4.9,5.2,5.8,6.5,7.0,7.2,7.3,7.3,6.6,6.2,6.1,6.0,6.1,5.9,5.9,5.9,5.9,5.8,5.8,5.5,5.5,5.6,5.9,5.9])
	        @chocolate2 = Comida.new('Chocolate', '5',[4.6,4.6,4.7,4.7,4.8,4.7,4.8,4.8,4.6,4.4,4.7,4.7,4.8,4.7,5.2,5.9,5.9,5.7,5.4,5.3,5.1,4.8,4.8,4.9,5.9])
		@glucosa2 = Comida.new('Glucosa', '5',    [6.3,5.4,5.6,5.7,6.5,7.4,7.9,7.4,7.7,7.9,7.9,7.8,7.8,7.8,8.0,8.5,9.4,10.8,10.5,9.1,8.9,8.3,7.7,7.6,7.5])
		@individuo2 = Individuo.new('2',[@compota2,@yogurt2,@chocolate2],@glucosa2)

		@calculadora1 = Calculadora.new([@individuo1, @individuo2])
	end


	it 'Compota existe' do
        	expect(@compota1.to_s).to be == "\nCompota\n\nConcentraciones: [6.7, 6.5, 6.8, 6.9, 7.0, 7.1, 6.9, 6.9, 6.9, 6.7, 6.9, 7.3, 7.0, 7.0, 7.2, 7.1, 6.8, 7.2, 7.3, 7.0, 6.8, 6.7, 6.8, 6.7, 6.9]\nPeriodo de Tiempo: 5 minutos\n\nAIBC: 28.0"
    	end

	it 'Individuo existe' do
	        expect(@individuo1.to_s).to be == "\Individuo 1\nAlimentos:\n\nCompota\n\nConcentraciones: [6.7, 6.5, 6.8, 6.9, 7.0, 7.1, 6.9, 6.9, 6.9, 6.7, 6.9, 7.3, 7.0, 7.0, 7.2, 7.1, 6.8, 7.2, 7.3, 7.0, 6.8, 6.7, 6.8, 6.7, 6.9]\nPeriodo de Tiempo: 5 minutos\n\nAIBC: 28.0\nYogurt\n\nConcentraciones: [6.1, 6.6, 6.3, 6.3, 6.1, 6.9, 6.8, 6.5, 6.4, 6.9, 6.8, 6.5, 6.3, 6.2, 6.7, 6.2, 5.9, 5.8, 5.8, 5.8, 5.8, 5.8, 5.9, 6.2, 6.4]\nPeriodo de Tiempo: 5 minutos\n\nAIBC: 30.5\nChocolate\n\nConcentraciones: [6.5, 6.5, 6.7, 6.5, 6.5, 6.8, 6.7, 6.2, 6.5, 7.2, 6.9, 7.0, 6.3, 6.2, 6.1, 5.9, 5.8, 6.1, 6.7, 6.7, 6.6, 6.7, 6.9, 7.2, 7.1]\nPeriodo de Tiempo: 5 minutos\n\nAIBC: 18.5\nGlucosa\n\nConcentraciones: [4.9, 5.3, 5.9, 6.7, 7.2, 7.6, 8.0, 8.2, 8.2, 8.4, 8.3, 8.3, 8.0, 7.5, 7.1, 6.8, 6.8, 6.9, 6.8, 6.3, 6.2, 6.3, 6.2, 6.3, 6.1]\nPeriodo de Tiempo: 5 minutos\n\nAIBC: 256.0\n"
	end

	it 'Calculadora existe' do
		expect(@calculadora1.to_s).to be == "\nLista de Individuos y sus alimentos\nIndividuo 1\nAlimentos:\n\nCompota\n\nConcentraciones: [6.7, 6.5, 6.8, 6.9, 7.0, 7.1, 6.9, 6.9, 6.9, 6.7, 6.9, 7.3, 7.0, 7.0, 7.2, 7.1, 6.8, 7.2, 7.3, 7.0, 6.8, 6.7, 6.8, 6.7, 6.9]\nPeriodo de Tiempo: 5 minutos\n\nAIBC: 28.0\nYogurt\n\nConcentraciones: [6.1, 6.6, 6.3, 6.3, 6.1, 6.9, 6.8, 6.5, 6.4, 6.9, 6.8, 6.5, 6.3, 6.2, 6.7, 6.2, 5.9, 5.8, 5.8, 5.8, 5.8, 5.8, 5.9, 6.2, 6.4]\nPeriodo de Tiempo: 5 minutos\n\nAIBC: 30.5\nChocolate\n\nConcentraciones: [6.5, 6.5, 6.7, 6.5, 6.5, 6.8, 6.7, 6.2, 6.5, 7.2, 6.9, 7.0, 6.3, 6.2, 6.1, 5.9, 5.8, 6.1, 6.7, 6.7, 6.6, 6.7, 6.9, 7.2, 7.1]\nPeriodo de Tiempo: 5 minutos\n\nAIBC: 18.5\nGlucosa\n\nConcentraciones: [4.9, 5.3, 5.9, 6.7, 7.2, 7.6, 8.0, 8.2, 8.2, 8.4, 8.3, 8.3, 8.0, 7.5, 7.1, 6.8, 6.8, 6.9, 6.8, 6.3, 6.2, 6.3, 6.2, 6.3, 6.1]\nPeriodo de Tiempo: 5 minutos\n\nAIBC: 256.0\n\nIndividuo 2\nAlimentos:\n\nCompota\n\nConcentraciones: [4.6, 4.8, 5.3, 5.6, 6.1, 6.5, 6.6, 7.0, 7.0, 6.8, 6.4, 6.3, 6.1, 6.1, 6.2, 6.0, 6.1, 6.1, 6.2, 6.3, 6.4, 6.1, 6.1, 5.7, 5.9]\nPeriodo de Tiempo: 5 minutos\n\nAIBC: 183.25\nYogurt\n\nConcentraciones: [4.9, 4.9, 5.2, 5.8, 6.5, 7.0, 7.2, 7.3, 7.3, 6.6, 6.2, 6.1, 6.0, 6.1, 5.9, 5.9, 5.9, 5.9, 5.8, 5.8, 5.5, 5.5, 5.6, 5.9, 5.9]\nPeriodo de Tiempo: 5 minutos\n\nAIBC: 138.5\nChocolate\n\nConcentraciones: [4.6, 4.6, 4.7, 4.7, 4.8, 4.7, 4.8, 4.8, 4.6, 4.4, 4.7, 4.7, 4.8, 4.7, 5.2, 5.9, 5.9, 5.7, 5.4, 5.3, 5.1, 4.8, 4.8, 4.9, 5.9]\nPeriodo de Tiempo: 5 minutos\n\nAIBC: 44.75\nGlucosa\n\nConcentraciones: [6.3, 5.4, 5.6, 5.7, 6.5, 7.4, 7.9, 7.4, 7.7, 7.9, 7.9, 7.8, 7.8, 7.8, 8.0, 8.5, 9.4, 10.8, 10.5, 9.1, 8.9, 8.3, 7.7, 7.6, 7.5]\nPeriodo de Tiempo: 5 minutos\n\nAIBC: 196.0\n\n"
	end

	it 'Calculos existen' do
		expect(@calculadora1.mostrar_resultados).to be == "Resultados\nCompota 52.22\nYogurt 41.29\nChocolate 15.03\n"
	end
  end
  

  context 'Operaciones de Ordenación' do
         before :each do
                 @alimentos1 = Alimento.new("Huevo frito", 14.1, 0.0, 19.5)
                 @alimentos2 = Alimento.new("Leche vaca", 3.3, 4.8, 3.2)
                 @alimentos3 = Alimento.new("Yogurt", 3.8, 4.8, 3.8)
                 @alimentos4 = Alimento.new("Cerdo", 21.5, 0.0, 6.3)
                 @alimentos5 = Alimento.new("Ternera", 21.1, 0.0, 3.1)
                 @alimentos6 = Alimento.new("Pollo", 20.6, 0.0, 5.6)
                 @alimentos7 = Alimento.new("Bacalao", 17.7, 0.0, 0.4)
                 @alimentos8 = Alimento.new("Atún", 21.5, 0.0, 15.5)
                 @alimentos9 = Alimento.new("Salmón", 19.9, 0.0, 13.6)
                 @alimentos10 = Alimento.new("Aceite de oliva", 0.0, 0.2, 99.6)
                 @alimentos11 = Alimento.new("Chocolate", 5.3, 47.0, 30.0)
                 @alimentos12 = Alimento.new("Azúcar", 0.0, 99.8, 0.0)
                 @alimentos13 = Alimento.new("Arroz", 6.8, 77.7, 0.6)
                 @alimentos14 = Alimento.new("Lentejas", 23.5, 52.0, 1.4)
                 @alimentos15 = Alimento.new("Papas", 2.0, 15.4, 0.1)
                 @alimentos16 = Alimento.new("Tomate", 1.0, 3.5, 0.2)
                 @alimentos17 = Alimento.new("Cebolla", 1.3, 5.8, 0.3)
                 @alimentos18 = Alimento.new("Manzana", 0.3, 12.4, 0.4)
                 @alimentos19 = Alimento.new("Plátanos", 1.2, 21.4, 0.2)
                 @migrupo1 = Grupo.new(
                 "Huevos, lacteos y helados",
                 [ @alimentos1, @alimentos2, @alimentos3 ])
                 @migrupo2 = Grupo.new(
                 "Cerdo, Ternera y Pollo",
                 [ @alimentos4, @alimentos5, @alimentos6 ])
                 @migrupo3 = Grupo.new(
                 "Pescados y mariscos",
                 [ @alimentos7, @alimentos8, @alimentos9 ])
                 @migrupo4 = Grupo.new(
                 "Alimentos grasos",
                 [ @alimentos10, @alimentos11, @alimentos12 ])
                 @array = [@alimentos1, @alimentos2, @alimentos3, @alimentos4, @alimentos5, @alimentos6, @alimentos7, @alimentos8,
                 @alimentos9, @alimentos10, @alimentos11, @alimentos12, @alimentos13, @alimentos14, @alimentos15, @alimentos16,
                 @alimentos17, @alimentos18, @alimentos19]
                 @lista1 = Lista.new(nil,nil)

         end

         it "Array nuevo con sus elementos ordenados usando bucles for" do
                  @each = @array
                  Benchmark.bm do |f|
                      f.report("for:"){
                      swapped = true
                      n = @each.size-1
                      while swapped do
                        swapped = false
                        for i in 0..n-1
                          if @each[i].get_energetico > @each[i+1].get_energetico
                              @each[i], @each[i + 1] = @each[i + 1], @each[i]
                              swapped = true
                          end
                        end
                      end
                      }
                  end
                 #puts " Vector ordenado con for"
                 #for i in 0..@each.size-1
                 #  puts @each[i].get_energetico
                 #end
         end
 
         it "Array nuevo con sus elementos ordenados usando el metodo each" do
                @aux = []
                for i in 0..@array.size-1
                    @aux << @array[i].get_energetico
                end
                Benchmark.bm do |e|
                    e.report("each:"){
                    swapped = true
                    while swapped do
                          swapped = false
                          (0..@aux.size-2).each_with_index do  |j|
                              if  @aux[j] > @aux[j + 1]
                                  @aux[j], @aux[j + 1] = @aux[j + 1], @aux[j]
                                  swapped = true
                              end
                          end
                    end
                    }
                end 
                #for i in 0..@aux.size-1
                #  puts @aux[i]
                #end
 

         end
 
         it "Array nuevo con sus elementos ordenados usando el metodo sort" do
                aux = []
                Benchmark.bm do |s|
                    s.report("sort:"){
                        aux = @array.sort {|x,y| x.get_energetico <=> y.get_energetico}
                    }
                end
                aux.each{|i| @lista1.insertar(i)}
                #@lista1.to_s  
                expect(@array).to match_array(aux)
         end
  
  end
end
