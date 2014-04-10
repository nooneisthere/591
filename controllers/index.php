<?php
define('SERVER_ROOT', dirname(__FILE__));
define('SITE_ROOT','http://www.591pei.com/');
require_once 'router.php';
require_once 'py/biz/commonservice/action.php';
require_once 'py/web/validator/request.php';
require_once 'py/web/validator/validator.php';
require_once 'py/web/validator/validationFacade.php';
require_once(SERVER_ROOT.'/py/biz/commonservice/bizControl.php');
require_once(SERVER_ROOT.'/architecture/db/framework/loader.php');
require_once(SERVER_ROOT.'/py/db/entityloader/userLoader.php');
require_once(SERVER_ROOT.'/architecture/db/framework/drivers/mysqlConnection.php');
require_once(SERVER_ROOT.'/architecture/db/framework/serviceLocator.php');
require_once(SERVER_ROOT.'/architecture/entity/framework/PO.php');
class Index{
	public function __construct(){
		$router = new Router();
		$request = new RawRequest();
		//echo ($request->getTarget());
		if (file_exists($request->getTarget())){
			require_once($request->getTarget());
			$class = ucfirst($request->getPage()) . '_Action';
			//echo '<hr />@@@'.$class.'@@@<hr />';
			//初始化对应类
			if (class_exists($class)){
				$action = new $class;
			}else{
				//类的命名正确吗？
				die('class does not exist!');
			}
		}else{
			die('page does not exist!');
		}
		$router->setAction($action);
		$router->run($request);
	}
}
$index = new Index();
?>