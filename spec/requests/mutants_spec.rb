require "rails_helper"

RSpec.describe "Mutant", type: :request do
  let!(:dna_params_ok) {{ "dna" => [
    "ATGCGA",
    "CAGTGC",
    "TTATGT",
    "AGAAGG",
    "DCCCAA",
    "TTTTTG"
  ]}}

  let!(:dna_params_failed) {{ "dna" => [
    "ATGCGA",
    "CAGTGC",
    "TTFTRT",
    "AGAAGG",
    "DCFCCA",
    "TFGTTG"
  ]}}

  let!(:dna_params_failed_with_one) {{ "dna" => [
    "ATGT",
    "ABGT",
    "ATBT",
    "AGAC",
  ]}}

  let!(:dna_params_vertical) {{ "dna" => [
    "ATGT",
    "ABGT",
    "ATBT",
    "AGAT",
  ]}}

  let!(:dna_params_horizontal) {{ "dna" => [
    "AAAA",
    "ABGT",
    "ATBT",
    "CCCC",
  ]}}


  let!(:dna_params_oblique) {{ "dna" => [
    "BBCDEC",
    "ABDTFA",
    "BDBTCA",
    "DBDBEF",
    "TTBCBB",
    "TTDBCB",
  ]}}
  

  describe "POST /mutant" do
   
    context "Should be OK" do
      before { post "/mutant", params: dna_params_ok }
      context "response" do
        subject { response }
        it { is_expected.to have_http_status(:ok) }
      end
    end
  
    context "Should be FAIL" do
      before { post "/mutant", params: dna_params_failed }
      context "response" do
        subject { response }
        it { is_expected.to have_http_status(:forbidden) }
      end
    end
  
    context "Should be FAIL with one coincidence" do
      before { post "/mutant", params: dna_params_failed_with_one }
      context "response" do
        subject { response }
        it { is_expected.to have_http_status(:forbidden) }
      end
    end
  
    context "Should be OK with vertical params" do
      before { post "/mutant", params: dna_params_vertical }
      context "response" do
        subject { response }
        it { is_expected.to have_http_status(:ok) }
      end
    end
  
    context "Should be OK with horizontal params" do
      before { post "/mutant", params: dna_params_horizontal }
      context "response" do
        subject { response }
        it { is_expected.to have_http_status(:ok) }
      end
    end
    context "Should be OK with oblique params" do
      before { post "/mutant", params: dna_params_oblique }
      context "response" do
        subject { response }
        it { is_expected.to have_http_status(:ok) }
      end
    end

  end
end
