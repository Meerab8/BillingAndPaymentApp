# frozen_string_literal: true

module FindFeature
  def obtaining_features(planid, featureid)
    AdditionalFeature.find_by(plan_id: planid, feature_id: featureid)
  end
end
