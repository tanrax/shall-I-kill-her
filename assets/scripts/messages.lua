require 'assets/scripts/vendor/MessageInABottle'

local messages = {}
local duration = 30 

function messages.load()
	ocean = Ocean:new()
end

function messages.update(dt)
	ocean:update(dt)
end

function messages.draw()
	ocean:draw()
end

function messages.new_message(cap)
	local texts = {}
	texts.welcome = "Debo tomar una decisión. No saldré de esta habitación hasta que tenga claro si mataré o dejaré vivir a mi novia. ¿Qué ha pasado en mi vida para que haya llegado hasta aquí? Tengo poco tiempo. Su vida se tambalea entre mis dedos."
	texts.cap1preview="Esta preciosa en esta foto. Mi madre me ha dado mucho más de lo que yo nunca podré devolverle. No solo me otorgó la vida, sino una razón para continuarla. Sus enseñanzas y duro caracteres me ha ayudado a ser el hombre que soy ahora. Lo que más deseo en este mundo es que se sienta orgulloso de mi. De mi trabajo y mi pareja. Pero una zorra lo estropeó todo."
	texts.cap1stage="Se meó en lo que yo más amaba. Me atacó en todo lo que mi madre me enseñó y mis más profundas creencias. No creo de forma poco clara, como mis hermanos, sino de verdad. Y esta niña no hizo más que ridiculizarme. Reírse delante de mis amigos. Llamarme loco en la intimidad. Tacharme de primitivo. Imbécil. Equivocado.... Pero la idiota es ella, la inmoral, la pecadora, la puta…. Necesito calmarme, relajar mi mente. Oír la palabra del Señor. Si salgo en este estado la voy a matar. Debo serenarme para pensar con claridad. ¡Señor, háblame!"
	texts.cap2stage="Corintios 12:10 Por lo cual, por amor a Cristo me gozo en las debilidades, en afrentas, en necesidades, en persecuciones, en angustias; porque cuando soy débil, entonces soy fuerte. Igual de fuerte que me hizo ella. Se reía delante de mis amigos, pero para ayudarme a superar la timidez. Me llamaba loco para mejorar mis hábitos, para hacerme ver las manías que había aprendido de mi madre. Primitivo cuando no era tolerante con los demás. Y yo solo me enfadaba… como un imbécil. Una pequeña parte de mi alma le pertenece. Pero no debo olvidar donde la conocí, donde alquilé sus primeros besos. Mis padres nunca deben saber la verdad. Mi madre no debe averiguar que humos aspiré, cuantas copas bebí esa noche. Debo destruir este papel. Nadie debe verlo."
	texts.cap3stage="Mientras el humo exploraba mis fosas nasales, recordé las barbacoas que hacíamos todos los sábados con mi familia. A ella la adoraban mis primos, y les caía muy bien a mis tíos. Mi padre siempre le hablaba sobre trucos de pesca, y mi madre la cuidaba como si fuera su propia hija. Estaba totalmente integrada a la familia. Por lo que la invitamos a venir a una barbacoa. Y entonces, mientras bendecíamos la mesa, ella se puso a comer. En el silencio se escuchó su boca mascando una grasienta salchicha. Todos la miraron sin aliento, y a continuación a mi con una mueca de indignación. No podía creer que estuviera sucediendo. La llevé a parte, a la cabaña de la leña. Lo que allí le dije no se borrará fácilmente de su memoria. Nunca conocí a una persona tan poco sensible… tan tan… y para disculparse nos regaló un jodido disco. ¿Piensa que puede comprarnos? Menuda mierda de regalo."
	texts.cap4stage="Me encanta esta canción. Ya recuerdo porque nos lo regaló. En el disco estaba nuestra canción. Una disculpa escondida a mi. Tal vez me alteré más de lo que tocaba. Después de todo ella no es religiosa, nunca había bendecido una mesa. Ni siquiera había visto cómo se realizaba. Hizo lo que cualquier otra persona hubiera hecho: sentarse y comer. Pobreta. No tuve que coger el disco, sus lágrimas eran más que suficientes. Nunca buscó hacer daño. Pero en cambio yo sí… ahora debo matarla. Lo tengo que hacer antes de que diga más mentiras sobre mi. Que manche mi imagen familiar. No lo puedo permitir. No soy gay. No estoy enfermo. No pienso usar esta llave. Saldré por la puerta y acabaré con ella. Se acabó los recuerdos, ya he tomado una decisión."
	texts.endbad="Muere puta"
	texts.endgood="Mi sujetador. Qué incómodo es. Siempre he odiado llevarlo, me hacen daño en los pechos. En nuestro primer aniversario secreto me regaló un conjunto. Me ha comprendido. Me ha ayudado siempre a crecer. A romper ataduras. Como la que me encuentro ahora. Decir a mi madre que soy una mujer que ama a otras… mujeres. Y que el Señor solo quiere que yo sea feliz. Tengo que ser fuerte. Corintios 12:10 Por lo cual, por amor a Cristo me gozo en las debilidades, en afrentas, en necesidades, en persecuciones, en angustias; porque cuando soy débil, entonces soy fuerte. Gracias mi amor."
	local bottle = TimeBottle:new(cap, texts['' .. cap], duration)
  	bottle:setX(30)
  	bottle:setY(500)
  	bottle:setWidth(1220)
  	bottle:setHeight(140)
  	bottle:setVolume(0)
  	ocean:addBottle(bottle)
end

return messages

