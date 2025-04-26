package SQ.CustomAnalysis;

import com.strategyquant.lib.*;

import java.util.ArrayList;

import com.strategyquant.datalib.*;
import com.strategyquant.tradinglib.*;

public class CAForDow extends CustomAnalysisMethod {

	//------------------------------------------------------------------------
	//------------------------------------------------------------------------
	//------------------------------------------------------------------------
	
	public CAForDow() {
		super("CAForDow", TYPE_FILTER_STRATEGY);
	}
	
	//------------------------------------------------------------------------
	
	@Override
	public boolean filterStrategy(String project, String task, String databankName, ResultsGroup rg) throws Exception {
		String key = rg.getMainResultKey();
		Result result = rg.subResult(key);
		SQStats statsIS = result.stats(Directions.Both, PlTypes.Money, SampleTypes.FullSample);
		double grossProfit = statsIS.getDouble("GrossProfit");
		double grossLoss = statsIS.getDouble("GrossLoss");
		if (grossProfit >= (1.5 * grossLoss))
			return true;
		return false;
	}
	
	
	//------------------------------------------------------------------------
	
	@Override
	public ArrayList<ResultsGroup> processDatabank(String project, String task, String databankName, ArrayList<ResultsGroup> databankRG) throws Exception {
		return databankRG;
	}
}