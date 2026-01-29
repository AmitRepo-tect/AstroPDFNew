package com.ojassoft.astrosagecloud.util;

import java.util.logging.Level;
import java.util.logging.Logger;

import org.apache.commons.jcs.JCS;
import org.apache.commons.jcs.access.CacheAccess;
import org.apache.commons.jcs.access.exception.CacheException;


public class OjasCache 
{
	private final static Logger LOGGER = Logger.getLogger(OjasCache.class.getName());
	
    private CacheAccess<String, Object> cache = null;

    public OjasCache() 
    {
        try 
        {
            cache = JCS.getInstance("auxiliary");
        }
        catch ( CacheException e ) 
        {
        	LOGGER.log(Level.INFO, "Problem initializing cache: " + e.getMessage());
        }
    }

    public void putInCache(String key, Object value) 
    {        
        try 
        {
            cache.put( key, value );
        }
        catch ( CacheException e ) 
        {
        	LOGGER.log(Level.INFO, "Problem putting Object in the cache, for key(" + key + "): "  + e.getMessage());
        }
    }

    public Object retrieveFromCache( String key ) 
    {
        return cache.get(key);
    }

}