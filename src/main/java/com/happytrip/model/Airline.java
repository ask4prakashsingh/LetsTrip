package com.happytrip.model;

import java.io.Serializable;
import java.util.Set;


/**
 * The persistent class for the airlines database table.
 * 
 */

public class Airline implements Serializable {
	private static final long serialVersionUID = 1L;

	private long airlineId;


	private String airlineCode;


	private String airlineLogo;


	private String airlineName;

	//bi-directional many-to-one association to Flight

	private Set<Flight> flights;

    public Airline() {
    }

	public Airline(long long1) {
		this.airlineId = long1;
	}

	public long getAirlineId() {
		return this.airlineId;
	}

	public void setAirlineId(long airlineId) {
		this.airlineId = airlineId;
	}

	public String getAirlineCode() {
		return this.airlineCode;
	}

	public void setAirlineCode(String airlineCode) {
		this.airlineCode = airlineCode;
	}

	public String getAirlineLogo() {
		return this.airlineLogo;
	}

	public void setAirlineLogo(String airlineLogo) {
		this.airlineLogo = airlineLogo;
	}

	public String getAirlineName() {
		return this.airlineName;
	}

	public void setAirlineName(String airlineName) {
		this.airlineName = airlineName;
	}

	public Set<Flight> getFlights() {
		return this.flights;
	}

	public void setFlights(Set<Flight> flights) {
		this.flights = flights;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
//		result = prime * result
//				+ ((airlineCode == null) ? 0 : airlineCode.hashCode());
	//	result = prime * result + (int) (airlineId ^ (airlineId >>> 32));
//		result = prime * result
//				+ ((airlineLogo == null) ? 0 : airlineLogo.hashCode());
		result = prime * result
				+ ((airlineName == null) ? 0 : airlineName.hashCode());
		result = prime * result + ((flights == null) ? 0 : flights.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Airline other = (Airline) obj;
		/*if (airlineCode == null) {
			if (other.airlineCode != null)
				return false;
		} else if (!airlineCode.equals(other.airlineCode))
			return false;*/
		/*if (airlineId != other.airlineId)
			return false;
		if (airlineLogo == null) {
			if (other.airlineLogo != null)
				return false;
		} else if (!airlineLogo.equals(other.airlineLogo))
			return false;*/
		if (airlineName == null) {
			if (other.airlineName != null)
				return false;
		} else if (!airlineName.equals(other.airlineName))
			return false;
		if (flights == null) {
			if (other.flights != null)
				return false;
		} else if (!flights.equals(other.flights))
			return false;
		return true;
	}
	
}