<?php

class CacheMemcache {

    var $iTtl = 600; // Time To Live
    var $bEnabled = false; // Memcache enabled?
    var $oCache = null;

    // constructor
    function CacheMemcache() {
        if (class_exists('Memcached')) {
            $this->oCache = new Memcached();
            $this->bEnabled = true;
            $this->oCache->addServer('localhost', 11211);
            if (! $this->oCache->addServer('localhost', 11211))  { // Instead 'localhost' here can be IP
                $this->oCache = null;
                $this->bEnabled = true;
            }
        }
    }

    // get data from cache server
    function getData($sKey) {
        $vData = $this->oCache->get($sKey);
        return false === $vData ? null : $vData;
    }

    // save data to cache server
    function setData($sKey, $vData) {
        //Use MEMCACHE_COMPRESSED to store the item compressed (uses zlib).
        // return $this->oCache->set($sKey, $vData, 0, $this->iTtl);
        return $this->oCache->set($sKey, $vData);
    }

    // delete data from cache server
    function delData($sKey) {
        return $this->oCache->delete($sKey);
    }
}

?>
