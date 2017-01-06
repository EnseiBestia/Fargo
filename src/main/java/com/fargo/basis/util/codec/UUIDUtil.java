package com.fargo.basis.util.codec;

import java.nio.ByteBuffer;
import java.util.UUID;

import org.apache.commons.codec.binary.Base64;

public class UUIDUtil {
	public static String genBase64UUID(){
		UUID uuid = UUID.randomUUID();
		ByteBuffer uuidBytes = ByteBuffer.wrap(new byte[16]);
		uuidBytes.putLong(uuid.getMostSignificantBits());
		uuidBytes.putLong(uuid.getLeastSignificantBits());
		byte[] uuidArray = uuidBytes.array();
		return Base64.encodeBase64URLSafeString(uuidArray);
	}
}
