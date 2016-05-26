<?php
/**
 * Esta clase fue y será generada automáticamente. NO EDITAR A MANO.
 * @ignore
 */
class descentralizado_autoload 
{
	static function existe_clase($nombre)
	{
		return isset(self::$clases[$nombre]);
	}

	static function cargar($nombre)
	{
		if (self::existe_clase($nombre)) { 
			 require_once(dirname(__FILE__) .'/'. self::$clases[$nombre]); 
		}
	}

	static protected $clases = array(
            'abm_ci' => 'extension_toba/componentes/abm_ci.php',
		'descentralizado_ci' => 'extension_toba/componentes/descentralizado_ci.php',
		'descentralizado_cn' => 'extension_toba/componentes/descentralizado_cn.php',
		'descentralizado_datos_relacion' => 'extension_toba/componentes/descentralizado_datos_relacion.php',
		'descentralizado_datos_tabla' => 'extension_toba/componentes/descentralizado_datos_tabla.php',
		'descentralizado_ei_arbol' => 'extension_toba/componentes/descentralizado_ei_arbol.php',
		'descentralizado_ei_archivos' => 'extension_toba/componentes/descentralizado_ei_archivos.php',
		'descentralizado_ei_calendario' => 'extension_toba/componentes/descentralizado_ei_calendario.php',
		'descentralizado_ei_codigo' => 'extension_toba/componentes/descentralizado_ei_codigo.php',
		'descentralizado_ei_cuadro' => 'extension_toba/componentes/descentralizado_ei_cuadro.php',
		'descentralizado_ei_esquema' => 'extension_toba/componentes/descentralizado_ei_esquema.php',
		'descentralizado_ei_filtro' => 'extension_toba/componentes/descentralizado_ei_filtro.php',
		'descentralizado_ei_firma' => 'extension_toba/componentes/descentralizado_ei_firma.php',
		'descentralizado_ei_formulario' => 'extension_toba/componentes/descentralizado_ei_formulario.php',
		'descentralizado_ei_formulario_ml' => 'extension_toba/componentes/descentralizado_ei_formulario_ml.php',
		'descentralizado_ei_grafico' => 'extension_toba/componentes/descentralizado_ei_grafico.php',
		'descentralizado_ei_mapa' => 'extension_toba/componentes/descentralizado_ei_mapa.php',
		'descentralizado_servicio_web' => 'extension_toba/componentes/descentralizado_servicio_web.php',
		'descentralizado_comando' => 'extension_toba/descentralizado_comando.php',
		'descentralizado_modelo' => 'extension_toba/descentralizado_modelo.php',
	);
}
?>